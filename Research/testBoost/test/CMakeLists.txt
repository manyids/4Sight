cmake_minimum_required(VERSION 2.8)
FIND_PACKAGE( Boost 1.40 COMPONENTS program_options serialization archive REQUIRED )
INCLUDE_DIRECTORIES( ${Boost_INCLUDE_DIR} )

set(CMAKE_CXX_FLAGS "-lboost_serialization -lboost_filesystem")
ADD_EXECUTABLE( test test.cpp )
TARGET_LINK_LIBRARIES( test ${Boost_LIBRARIES} )