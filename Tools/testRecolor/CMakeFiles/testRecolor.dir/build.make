# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The program to use to edit the cache.
CMAKE_EDIT_COMMAND = /usr/bin/ccmake

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/odroid/CV/b4Sight/Tools/testRecolor

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/odroid/CV/b4Sight/Tools/testRecolor

# Include any dependencies generated for this target.
include CMakeFiles/testRecolor.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/testRecolor.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/testRecolor.dir/flags.make

CMakeFiles/testRecolor.dir/testRecolor.cpp.o: CMakeFiles/testRecolor.dir/flags.make
CMakeFiles/testRecolor.dir/testRecolor.cpp.o: testRecolor.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/odroid/CV/b4Sight/Tools/testRecolor/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/testRecolor.dir/testRecolor.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/testRecolor.dir/testRecolor.cpp.o -c /home/odroid/CV/b4Sight/Tools/testRecolor/testRecolor.cpp

CMakeFiles/testRecolor.dir/testRecolor.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/testRecolor.dir/testRecolor.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/odroid/CV/b4Sight/Tools/testRecolor/testRecolor.cpp > CMakeFiles/testRecolor.dir/testRecolor.cpp.i

CMakeFiles/testRecolor.dir/testRecolor.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/testRecolor.dir/testRecolor.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/odroid/CV/b4Sight/Tools/testRecolor/testRecolor.cpp -o CMakeFiles/testRecolor.dir/testRecolor.cpp.s

CMakeFiles/testRecolor.dir/testRecolor.cpp.o.requires:
.PHONY : CMakeFiles/testRecolor.dir/testRecolor.cpp.o.requires

CMakeFiles/testRecolor.dir/testRecolor.cpp.o.provides: CMakeFiles/testRecolor.dir/testRecolor.cpp.o.requires
	$(MAKE) -f CMakeFiles/testRecolor.dir/build.make CMakeFiles/testRecolor.dir/testRecolor.cpp.o.provides.build
.PHONY : CMakeFiles/testRecolor.dir/testRecolor.cpp.o.provides

CMakeFiles/testRecolor.dir/testRecolor.cpp.o.provides.build: CMakeFiles/testRecolor.dir/testRecolor.cpp.o

# Object files for target testRecolor
testRecolor_OBJECTS = \
"CMakeFiles/testRecolor.dir/testRecolor.cpp.o"

# External object files for target testRecolor
testRecolor_EXTERNAL_OBJECTS =

testRecolor: CMakeFiles/testRecolor.dir/testRecolor.cpp.o
testRecolor: CMakeFiles/testRecolor.dir/build.make
testRecolor: /usr/local/lib/libopencv_videostab.so.3.0.0
testRecolor: /usr/local/lib/libopencv_videoio.so.3.0.0
testRecolor: /usr/local/lib/libopencv_video.so.3.0.0
testRecolor: /usr/local/lib/libopencv_ts.a
testRecolor: /usr/local/lib/libopencv_superres.so.3.0.0
testRecolor: /usr/local/lib/libopencv_stitching.so.3.0.0
testRecolor: /usr/local/lib/libopencv_shape.so.3.0.0
testRecolor: /usr/local/lib/libopencv_photo.so.3.0.0
testRecolor: /usr/local/lib/libopencv_objdetect.so.3.0.0
testRecolor: /usr/local/lib/libopencv_ml.so.3.0.0
testRecolor: /usr/local/lib/libopencv_imgproc.so.3.0.0
testRecolor: /usr/local/lib/libopencv_imgcodecs.so.3.0.0
testRecolor: /usr/local/lib/libopencv_highgui.so.3.0.0
testRecolor: /usr/local/lib/libopencv_flann.so.3.0.0
testRecolor: /usr/local/lib/libopencv_features2d.so.3.0.0
testRecolor: /usr/local/lib/libopencv_core.so.3.0.0
testRecolor: /usr/local/lib/libopencv_calib3d.so.3.0.0
testRecolor: /usr/local/lib/libopencv_features2d.so.3.0.0
testRecolor: /usr/local/lib/libopencv_ml.so.3.0.0
testRecolor: /usr/local/lib/libopencv_highgui.so.3.0.0
testRecolor: /usr/local/lib/libopencv_videoio.so.3.0.0
testRecolor: /usr/local/lib/libopencv_imgcodecs.so.3.0.0
testRecolor: /usr/local/lib/libopencv_flann.so.3.0.0
testRecolor: /usr/local/lib/libopencv_video.so.3.0.0
testRecolor: /usr/local/lib/libopencv_imgproc.so.3.0.0
testRecolor: /usr/local/lib/libopencv_core.so.3.0.0
testRecolor: CMakeFiles/testRecolor.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable testRecolor"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/testRecolor.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/testRecolor.dir/build: testRecolor
.PHONY : CMakeFiles/testRecolor.dir/build

CMakeFiles/testRecolor.dir/requires: CMakeFiles/testRecolor.dir/testRecolor.cpp.o.requires
.PHONY : CMakeFiles/testRecolor.dir/requires

CMakeFiles/testRecolor.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/testRecolor.dir/cmake_clean.cmake
.PHONY : CMakeFiles/testRecolor.dir/clean

CMakeFiles/testRecolor.dir/depend:
	cd /home/odroid/CV/b4Sight/Tools/testRecolor && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/odroid/CV/b4Sight/Tools/testRecolor /home/odroid/CV/b4Sight/Tools/testRecolor /home/odroid/CV/b4Sight/Tools/testRecolor /home/odroid/CV/b4Sight/Tools/testRecolor /home/odroid/CV/b4Sight/Tools/testRecolor/CMakeFiles/testRecolor.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/testRecolor.dir/depend

