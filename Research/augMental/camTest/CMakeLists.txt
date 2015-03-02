cmake_minimum_required(VERSION 2.8)

project(camTest)

SET( CMAKE_CXX_FLAGS  "-mfpu=neon -mfloat-abi=hard" )

find_package( OpenCV REQUIRED )
find_package(OpenGL REQUIRED)
find_package(GLUT REQUIRED)
include_directories( ${OPENGL_INCLUDE_DIRS}  ${GLUT_INCLUDE_DIRS}  ${OpenCV_INCLUDE_DIRS} ${Boost_INCLUDE_DIR} )

add_executable(camTest camTest.cpp)
target_link_libraries(camTest ${OPENGL_LIBRARIES} ${GLUT_LIBRARY} ${OpenCV_LIBS})

add_executable(getCorners getCorners.cpp)
target_link_libraries(getCorners ${OPENGL_LIBRARIES} ${GLUT_LIBRARY} ${OpenCV_LIBS} ${Boost_LIBRARIES} )

add_executable(compareTimeThresh compareTimeThresh.cpp)
target_link_libraries(compareTimeThresh ${OPENGL_LIBRARIES} ${GLUT_LIBRARY} ${OpenCV_LIBS} ${Boost_LIBRARIES} )

add_executable(testImage testImage.cpp)
target_link_libraries(testImage ${OPENGL_LIBRARIES} ${GLUT_LIBRARY} ${OpenCV_LIBS} ${Boost_LIBRARIES} )