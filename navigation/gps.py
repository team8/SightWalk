import json

from gps import *
import time
import openrouteservice as ors
import constants

gpsd = gps(mode=WATCH_ENABLE | WATCH_NEWSTYLE)
currentLat = 0.0
currentLon = 0.0


client = ors.Client(key=constants.api_key)

def get_current_address():
    report = gpsd.next()  #
    if report['class'] == 'TPV':
        currentLat = getattr(report, 'lat', 0.0)
        currentLon = getattr(report, 'lon', 0.0)
        print(currentLat, "\t", currentLon)
        coordinate = [currentLon, currentLat]
        reverse = client.pelias_reverse(
            point=coordinate,
            validate=True,
        )
        print(reverse["features"][0]["properties"]["name"])
        return None if currentLat == 0 and currentLon == 0 else (reverse["features"][0]["properties"]["name"])
    return None


def get_current_coordinate():
    report = gpsd.next()  #
    if report['class'] == 'TPV':
        currentLat = getattr(report, 'lat', 0.0)
        currentLon = getattr(report, 'lon', 0.0)
        print(currentLat, "\t", currentLon)
        coordinate = {"Longitude": currentLon, "Latitude": currentLat}
        return None if currentLat == 0 and currentLon == 0 else coordinate

