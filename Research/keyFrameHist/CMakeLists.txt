cmake_minimum_required(VERSION 2.8)
project( keyFrameHist )
SET( CMAKE_CXX_FLAGS  "-mfpu=neon -mfloat-abi=hard" )
find_package( OpenCV REQUIRED )
include_directories( ${OpenCV_INCLUDE_DIRS} )
add_executable( keyFrameHist keyFrameHist.cpp )
target_link_libraries( keyFrameHist ${OpenCV_LIBS} )
add_executable( keyFrameHistVid keyFrameHistVid.cpp )
target_link_libraries( keyFrameHistVid ${OpenCV_LIBS} )