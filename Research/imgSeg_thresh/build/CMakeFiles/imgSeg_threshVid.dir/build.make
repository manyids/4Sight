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
CMAKE_SOURCE_DIR = /home/odroid/CV/b4Sight/Research/imgSeg_thresh

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/odroid/CV/b4Sight/Research/imgSeg_thresh/build

# Include any dependencies generated for this target.
include CMakeFiles/imgSeg_threshVid.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/imgSeg_threshVid.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/imgSeg_threshVid.dir/flags.make

CMakeFiles/imgSeg_threshVid.dir/imgSeg_threshVid.cpp.o: CMakeFiles/imgSeg_threshVid.dir/flags.make
CMakeFiles/imgSeg_threshVid.dir/imgSeg_threshVid.cpp.o: ../imgSeg_threshVid.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/odroid/CV/b4Sight/Research/imgSeg_thresh/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/imgSeg_threshVid.dir/imgSeg_threshVid.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/imgSeg_threshVid.dir/imgSeg_threshVid.cpp.o -c /home/odroid/CV/b4Sight/Research/imgSeg_thresh/imgSeg_threshVid.cpp

CMakeFiles/imgSeg_threshVid.dir/imgSeg_threshVid.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/imgSeg_threshVid.dir/imgSeg_threshVid.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/odroid/CV/b4Sight/Research/imgSeg_thresh/imgSeg_threshVid.cpp > CMakeFiles/imgSeg_threshVid.dir/imgSeg_threshVid.cpp.i

CMakeFiles/imgSeg_threshVid.dir/imgSeg_threshVid.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/imgSeg_threshVid.dir/imgSeg_threshVid.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/odroid/CV/b4Sight/Research/imgSeg_thresh/imgSeg_threshVid.cpp -o CMakeFiles/imgSeg_threshVid.dir/imgSeg_threshVid.cpp.s

CMakeFiles/imgSeg_threshVid.dir/imgSeg_threshVid.cpp.o.requires:
.PHONY : CMakeFiles/imgSeg_threshVid.dir/imgSeg_threshVid.cpp.o.requires

CMakeFiles/imgSeg_threshVid.dir/imgSeg_threshVid.cpp.o.provides: CMakeFiles/imgSeg_threshVid.dir/imgSeg_threshVid.cpp.o.requires
	$(MAKE) -f CMakeFiles/imgSeg_threshVid.dir/build.make CMakeFiles/imgSeg_threshVid.dir/imgSeg_threshVid.cpp.o.provides.build
.PHONY : CMakeFiles/imgSeg_threshVid.dir/imgSeg_threshVid.cpp.o.provides

CMakeFiles/imgSeg_threshVid.dir/imgSeg_threshVid.cpp.o.provides.build: CMakeFiles/imgSeg_threshVid.dir/imgSeg_threshVid.cpp.o

# Object files for target imgSeg_threshVid
imgSeg_threshVid_OBJECTS = \
"CMakeFiles/imgSeg_threshVid.dir/imgSeg_threshVid.cpp.o"

# External object files for target imgSeg_threshVid
imgSeg_threshVid_EXTERNAL_OBJECTS =

imgSeg_threshVid: CMakeFiles/imgSeg_threshVid.dir/imgSeg_threshVid.cpp.o
imgSeg_threshVid: CMakeFiles/imgSeg_threshVid.dir/build.make
imgSeg_threshVid: /usr/local/lib/libopencv_videostab.so.3.0.0
imgSeg_threshVid: /usr/local/lib/libopencv_videoio.so.3.0.0
imgSeg_threshVid: /usr/local/lib/libopencv_video.so.3.0.0
imgSeg_threshVid: /usr/local/lib/libopencv_ts.a
imgSeg_threshVid: /usr/local/lib/libopencv_superres.so.3.0.0
imgSeg_threshVid: /usr/local/lib/libopencv_stitching.so.3.0.0
imgSeg_threshVid: /usr/local/lib/libopencv_shape.so.3.0.0
imgSeg_threshVid: /usr/local/lib/libopencv_photo.so.3.0.0
imgSeg_threshVid: /usr/local/lib/libopencv_objdetect.so.3.0.0
imgSeg_threshVid: /usr/local/lib/libopencv_ml.so.3.0.0
imgSeg_threshVid: /usr/local/lib/libopencv_imgproc.so.3.0.0
imgSeg_threshVid: /usr/local/lib/libopencv_imgcodecs.so.3.0.0
imgSeg_threshVid: /usr/local/lib/libopencv_highgui.so.3.0.0
imgSeg_threshVid: /usr/local/lib/libopencv_flann.so.3.0.0
imgSeg_threshVid: /usr/local/lib/libopencv_features2d.so.3.0.0
imgSeg_threshVid: /usr/local/lib/libopencv_core.so.3.0.0
imgSeg_threshVid: /usr/local/lib/libopencv_calib3d.so.3.0.0
imgSeg_threshVid: /usr/local/lib/libopencv_features2d.so.3.0.0
imgSeg_threshVid: /usr/local/lib/libopencv_ml.so.3.0.0
imgSeg_threshVid: /usr/local/lib/libopencv_highgui.so.3.0.0
imgSeg_threshVid: /usr/local/lib/libopencv_videoio.so.3.0.0
imgSeg_threshVid: /usr/local/lib/libopencv_imgcodecs.so.3.0.0
imgSeg_threshVid: /usr/local/lib/libopencv_flann.so.3.0.0
imgSeg_threshVid: /usr/local/lib/libopencv_video.so.3.0.0
imgSeg_threshVid: /usr/local/lib/libopencv_imgproc.so.3.0.0
imgSeg_threshVid: /usr/local/lib/libopencv_core.so.3.0.0
imgSeg_threshVid: CMakeFiles/imgSeg_threshVid.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable imgSeg_threshVid"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/imgSeg_threshVid.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/imgSeg_threshVid.dir/build: imgSeg_threshVid
.PHONY : CMakeFiles/imgSeg_threshVid.dir/build

CMakeFiles/imgSeg_threshVid.dir/requires: CMakeFiles/imgSeg_threshVid.dir/imgSeg_threshVid.cpp.o.requires
.PHONY : CMakeFiles/imgSeg_threshVid.dir/requires

CMakeFiles/imgSeg_threshVid.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/imgSeg_threshVid.dir/cmake_clean.cmake
.PHONY : CMakeFiles/imgSeg_threshVid.dir/clean

CMakeFiles/imgSeg_threshVid.dir/depend:
	cd /home/odroid/CV/b4Sight/Research/imgSeg_thresh/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/odroid/CV/b4Sight/Research/imgSeg_thresh /home/odroid/CV/b4Sight/Research/imgSeg_thresh /home/odroid/CV/b4Sight/Research/imgSeg_thresh/build /home/odroid/CV/b4Sight/Research/imgSeg_thresh/build /home/odroid/CV/b4Sight/Research/imgSeg_thresh/build/CMakeFiles/imgSeg_threshVid.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/imgSeg_threshVid.dir/depend
