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
CMAKE_SOURCE_DIR = /home/odroid/CV/b4Sight/Research/keyFrameHist

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/odroid/CV/b4Sight/Research/keyFrameHist/build

# Include any dependencies generated for this target.
include CMakeFiles/keyFrameHist.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/keyFrameHist.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/keyFrameHist.dir/flags.make

CMakeFiles/keyFrameHist.dir/keyFrameHist.cpp.o: CMakeFiles/keyFrameHist.dir/flags.make
CMakeFiles/keyFrameHist.dir/keyFrameHist.cpp.o: ../keyFrameHist.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/odroid/CV/b4Sight/Research/keyFrameHist/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/keyFrameHist.dir/keyFrameHist.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/keyFrameHist.dir/keyFrameHist.cpp.o -c /home/odroid/CV/b4Sight/Research/keyFrameHist/keyFrameHist.cpp

CMakeFiles/keyFrameHist.dir/keyFrameHist.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/keyFrameHist.dir/keyFrameHist.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/odroid/CV/b4Sight/Research/keyFrameHist/keyFrameHist.cpp > CMakeFiles/keyFrameHist.dir/keyFrameHist.cpp.i

CMakeFiles/keyFrameHist.dir/keyFrameHist.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/keyFrameHist.dir/keyFrameHist.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/odroid/CV/b4Sight/Research/keyFrameHist/keyFrameHist.cpp -o CMakeFiles/keyFrameHist.dir/keyFrameHist.cpp.s

CMakeFiles/keyFrameHist.dir/keyFrameHist.cpp.o.requires:
.PHONY : CMakeFiles/keyFrameHist.dir/keyFrameHist.cpp.o.requires

CMakeFiles/keyFrameHist.dir/keyFrameHist.cpp.o.provides: CMakeFiles/keyFrameHist.dir/keyFrameHist.cpp.o.requires
	$(MAKE) -f CMakeFiles/keyFrameHist.dir/build.make CMakeFiles/keyFrameHist.dir/keyFrameHist.cpp.o.provides.build
.PHONY : CMakeFiles/keyFrameHist.dir/keyFrameHist.cpp.o.provides

CMakeFiles/keyFrameHist.dir/keyFrameHist.cpp.o.provides.build: CMakeFiles/keyFrameHist.dir/keyFrameHist.cpp.o

# Object files for target keyFrameHist
keyFrameHist_OBJECTS = \
"CMakeFiles/keyFrameHist.dir/keyFrameHist.cpp.o"

# External object files for target keyFrameHist
keyFrameHist_EXTERNAL_OBJECTS =

keyFrameHist: CMakeFiles/keyFrameHist.dir/keyFrameHist.cpp.o
keyFrameHist: CMakeFiles/keyFrameHist.dir/build.make
keyFrameHist: /usr/local/lib/libopencv_videostab.so.3.0.0
keyFrameHist: /usr/local/lib/libopencv_videoio.so.3.0.0
keyFrameHist: /usr/local/lib/libopencv_video.so.3.0.0
keyFrameHist: /usr/local/lib/libopencv_ts.a
keyFrameHist: /usr/local/lib/libopencv_superres.so.3.0.0
keyFrameHist: /usr/local/lib/libopencv_stitching.so.3.0.0
keyFrameHist: /usr/local/lib/libopencv_shape.so.3.0.0
keyFrameHist: /usr/local/lib/libopencv_photo.so.3.0.0
keyFrameHist: /usr/local/lib/libopencv_objdetect.so.3.0.0
keyFrameHist: /usr/local/lib/libopencv_ml.so.3.0.0
keyFrameHist: /usr/local/lib/libopencv_imgproc.so.3.0.0
keyFrameHist: /usr/local/lib/libopencv_imgcodecs.so.3.0.0
keyFrameHist: /usr/local/lib/libopencv_highgui.so.3.0.0
keyFrameHist: /usr/local/lib/libopencv_flann.so.3.0.0
keyFrameHist: /usr/local/lib/libopencv_features2d.so.3.0.0
keyFrameHist: /usr/local/lib/libopencv_core.so.3.0.0
keyFrameHist: /usr/local/lib/libopencv_calib3d.so.3.0.0
keyFrameHist: /usr/local/lib/libopencv_features2d.so.3.0.0
keyFrameHist: /usr/local/lib/libopencv_ml.so.3.0.0
keyFrameHist: /usr/local/lib/libopencv_highgui.so.3.0.0
keyFrameHist: /usr/local/lib/libopencv_videoio.so.3.0.0
keyFrameHist: /usr/local/lib/libopencv_imgcodecs.so.3.0.0
keyFrameHist: /usr/local/lib/libopencv_flann.so.3.0.0
keyFrameHist: /usr/local/lib/libopencv_video.so.3.0.0
keyFrameHist: /usr/local/lib/libopencv_imgproc.so.3.0.0
keyFrameHist: /usr/local/lib/libopencv_core.so.3.0.0
keyFrameHist: CMakeFiles/keyFrameHist.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable keyFrameHist"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/keyFrameHist.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/keyFrameHist.dir/build: keyFrameHist
.PHONY : CMakeFiles/keyFrameHist.dir/build

CMakeFiles/keyFrameHist.dir/requires: CMakeFiles/keyFrameHist.dir/keyFrameHist.cpp.o.requires
.PHONY : CMakeFiles/keyFrameHist.dir/requires

CMakeFiles/keyFrameHist.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/keyFrameHist.dir/cmake_clean.cmake
.PHONY : CMakeFiles/keyFrameHist.dir/clean

CMakeFiles/keyFrameHist.dir/depend:
	cd /home/odroid/CV/b4Sight/Research/keyFrameHist/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/odroid/CV/b4Sight/Research/keyFrameHist /home/odroid/CV/b4Sight/Research/keyFrameHist /home/odroid/CV/b4Sight/Research/keyFrameHist/build /home/odroid/CV/b4Sight/Research/keyFrameHist/build /home/odroid/CV/b4Sight/Research/keyFrameHist/build/CMakeFiles/keyFrameHist.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/keyFrameHist.dir/depend

