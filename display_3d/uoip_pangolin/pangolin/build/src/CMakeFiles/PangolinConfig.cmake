# Compute paths
get_filename_component( PROJECT_CMAKE_DIR "${CMAKE_CURRENT_LIST_FILE}" PATH )
SET( Pangolin_INCLUDE_DIRS "${PROJECT_CMAKE_DIR}/../../../include;/usr/include;/usr/include;/usr/include;/usr/include/eigen3" )
SET( Pangolin_INCLUDE_DIR  "${PROJECT_CMAKE_DIR}/../../../include;/usr/include;/usr/include;/usr/include;/usr/include/eigen3" )

# Library dependencies (contains definitions for IMPORTED targets)
if( NOT TARGET _pangolin AND NOT Pangolin_BINARY_DIR )
  include( "${PROJECT_CMAKE_DIR}/PangolinTargets.cmake" )
  
endif()

SET( Pangolin_LIBRARIES    _pangolin )
SET( Pangolin_LIBRARY      _pangolin )
SET( Pangolin_CMAKEMODULES /home/aoberai/programming/python/uoip-pangolin/pangolin/src/../CMakeModules )
