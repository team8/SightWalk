import cv2
import numpy as np
import threading
import time
from ctypes import *
from queue import Queue

import capturer
import darknet
import person_automobile_sign_detection.collision as collision
import person_automobile_sign_detection.detection_calc_util as ofu
from person_automobile_sign_detection.detection import Detection
from utils.circularBuffer import CircularBuffer


class Detector:
    weights_path = "person_automobile_sign_detection/yolov4.weights"
    # weights_path = "person_automobile_sign_detection/yolov4-tiny.weights"
    config_path = "person_automobile_sign_detection/yolov4-original.cfg"
    # config_path = "person_automobile_sign_detection/yolov4-tiny-original.cfg"
    data_file_path = "person_automobile_sign_detection/coco_original.data"
    # data_file_path = "person_automobile_sign_detection/coco.data"

    network, class_names, class_colors = darknet.load_network(
        config_path,
        data_file_path,
        weights_path,
        batch_size=1
    )
    running_detections = []
    detections_queue = CircularBuffer(2)
    prev_detections_queue = CircularBuffer(2)
    images_queue = Queue(maxsize=2)
    fps_queue = CircularBuffer(1)
    width = darknet.network_width(network)
    min_confidence = 25
    min_iou = 10  # min iou percentage for id'ing
    min_box_area = 700
    id_index = 0  # keeps increasing per new object identified
    height = darknet.network_height(network)
    colors = {"person": [255, 255, 0], "car": [100, 0, 0], "stop sign": [100, 100, 0]}

    def __init__(self):
        print("Initializing Object Localizer")

        threading.Thread(target=self.capture_processing).start()
        time.sleep(3)
        threading.Thread(target=self.detection_starter).start()

    def setup_collision_detector(self, viewer_size, viewer_stretch_factor):
        collision.set_constants(viewer_size, viewer_stretch_factor)

    def capture_processing(self):
        while True:
            try:
                frame = capturer.get_images().get_last()
                preprocessed_frame = cv2.resize(frame, (self.width, self.height), interpolation=cv2.INTER_LINEAR)
                darknet_image = darknet.make_image(self.width, self.height, 3)
                darknet.copy_image_from_bytes(darknet_image, preprocessed_frame.tobytes())
                self.images_queue.put((darknet_image, preprocessed_frame))
            except Exception as e:
                print("Capturing Not Working", e)

    def get_inference(self):
        inference = []
        for detection in self.running_detections:
            if detection.countSeen >= 7:
                output = {"label": detection.label, "confidence": 0, "bbox": detection.bbox, "id": detection.object_id,
                          "mdv": np.median(np.array(detection.mdv_history), axis=0).tolist(),
                          "colliding": detection.colliding}
                inference.append(output)
        return inference

    def detection_starter(self):
        while collision.viewer3d_size is None and collision.viewer3d_stretch is None:
            # If not initialized yet
            time.sleep(1)
        while True:
            last_darknet_image = self.images_queue.get()[0]
            last_time = time.time()
            detections = darknet.detect_image(self.network, self.class_names, last_darknet_image, thresh=0.25)

            self.prev_detections_queue.add(self.detections_queue.get_last())
            self.detections_queue.add(detections)
            self.update_running_detections(detections)
            self.fps_queue.add(1 / (time.time() - last_time))
            darknet.free_image(last_darknet_image)

    def update_running_detections(self, raw_detections_list):
        idSeen = []
        for raw_detection in raw_detections_list:
            if float(raw_detection[1]) > self.min_confidence and raw_detection[2][2] * raw_detection[2][
                3] > self.min_box_area:
                largest_iou = -1
                largest_iou_index = -1
                largest_iou_bbox = None
                for detection_index in range(0, len(self.running_detections)):

                    iou = ofu.compute_iou(self.running_detections[detection_index].bbox, raw_detection[2])
                    if raw_detection[0] == self.running_detections[
                        detection_index].label and iou > self.min_iou and iou > largest_iou:
                        largest_iou = iou
                        largest_iou_index = detection_index
                        largest_iou_bbox = raw_detection[2]

                if largest_iou != -1:
                    idSeen.append(self.running_detections[largest_iou_index].object_id)
                    self.running_detections[largest_iou_index].update(largest_iou_bbox)
                    # print("Associated BB", raw_detection[0])
                else:
                    # print("Adding new detection", raw_detection[0])
                    self.id_index += 1
                    self.running_detections.append(Detection(raw_detection[0], self.id_index, raw_detection[2]))

        indexToDelete = []
        for i in range(0, len(self.running_detections)):
            if self.running_detections[i].object_id not in idSeen:
                self.running_detections[i].update(None)
            if self.running_detections[i].evaluateRemove():
                indexToDelete.append(i)

        self.running_detections = [i for j, i in enumerate(self.running_detections) if j not in indexToDelete]

    def getFPS(self):
        return self.fps_queue.get_last()

    def display(self):
        while True:
            try:
                last_detection = self.detections_queue.get_last()
                last_image = self.images_queue.get()[1]
                fps = self.fps_queue.get_last()
                for detection in last_detection:
                    x, y, w, h = detection[2]
                    xmin = int(x - (w / 2))
                    xmax = int(x + (w / 2))
                    ymin = int(y - (h / 2))
                    ymax = int(y + (h / 2))
                    display_image = cv2.rectangle(last_image, (xmax, ymax), (xmin, ymin),
                                                  self.colors[detection[0]] if detection[0] in self.colors else [0, 100,
                                                                                                                 0], 4)
                cv2.imshow("Stream", display_image)
                cv2.waitKey(1)
            except Exception as e:
                print("Displaying Not Working", e)
