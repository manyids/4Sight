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
CMAKE_SOURCE_DIR = /home/odroid/CV/b4Sight/Research/multiColorThresh

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/odroid/CV/b4Sight/Research/multiColorThresh/build

# Include any dependencies generated for this target.
include CMakeFiles/multiColorThreshVid.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/multiColorThreshVid.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/multiColorThreshVid.dir/flags.make

CMakeFiles/multiColorThreshVid.dir/multiColorThreshVid.cpp.o: CMakeFiles/multiColorThreshVid.dir/flags.make
CMakeFiles/multiColorThreshVid.dir/multiColorThreshVid.cpp.o: ../multiColorThreshVid.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/odroid/CV/b4Sight/Research/multiColorThresh/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/multiColorThreshVid.dir/multiColorThreshVid.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/multiColorThreshVid.dir/multiColorThreshVid.cpp.o -c /home/odroid/CV/b4Sight/Research/multiColorThresh/multiColorThreshVid.cpp

CMakeFiles/multiColorThreshVid.dir/multiColorThreshVid.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/multiColorThreshVid.dir/multiColorThreshVid.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/odroid/CV/b4Sight/Research/multiColorThresh/multiColorThreshVid.cpp > CMakeFiles/multiColorThreshVid.dir/multiColorThreshVid.cpp.i

CMakeFiles/multiColorThreshVid.dir/multiColorThreshVid.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/multiColorThreshVid.dir/multiColorThreshVid.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/odroid/CV/b4Sight/Research/multiColorThresh/multiColorThreshVid.cpp -o CMakeFiles/multiColorThreshVid.dir/multiColorThreshVid.cpp.s

CMakeFiles/multiColorThreshVid.dir/multiColorThreshVid.cpp.o.requires:
.PHONY : CMakeFiles/multiColorThreshVid.dir/multiColorThreshVid.cpp.o.requires

CMakeFiles/multiColorThreshVid.dir/multiColorThreshVid.cpp.o.provides: CMakeFiles/multiColorThreshVid.dir/multiColorThreshVid.cpp.o.requires
	$(MAKE) -f CMakeFiles/multiColorThreshVid.dir/build.make CMakeFiles/multiColorThreshVid.dir/multiColorThreshVid.cpp.o.provides.build
.PHONY : CMakeFiles/multiColorThreshVid.dir/multiColorThreshVid.cpp.o.provides

CMakeFiles/multiColorThreshVid.dir/multiColorThreshVid.cpp.o.provides.build: CMakeFiles/multiColorThreshVid.dir/multiColorThreshVid.cpp.o

# Object files for target multiColorThreshVid
multiColorThreshVid_OBJECTS = \
"CMakeFiles/multiColorThreshVid.dir/multiColorThreshVid.cpp.o"

# External object files for target multiColorThreshVid
multiColorThreshVid_EXTERNAL_OBJECTS =

multiColorThreshVid: CMakeFiles/multiColorThreshVid.dir/multiColorThreshVid.cpp.o
multiColorThreshVid: CMakeFiles/multiColorThreshVid.dir/build.make
multiColorThreshVid: /usr/local/lib/libopencv_videostab.so.3.0.0
multiColorThreshVid: /usr/local/lib/libopencv_videoio.so.3.0.0
multiColorThreshVid: /usr/local/lib/libopencv_video.so.3.0.0
multiColorThreshVid: /usr/local/lib/libopencv_ts.a
multiColorThreshVid: /usr/local/lib/libopencv_superres.so.3.0.0
multiColorThreshVid: /usr/local/lib/libopencv_stitching.so.3.0.0
multiColorThreshVid: /usr/local/lib/libopencv_shape.so.3.0.0
multiColorThreshVid: /usr/local/lib/libopencv_photo.so.3.0.0
multiColorThreshVid: /usr/local/lib/libopencv_objdetect.so.3.0.0
multiColorThreshVid: /usr/local/lib/libopencv_ml.so.3.0.0
multiColorThreshVid: /usr/local/lib/libopencv_imgproc.so.3.0.0
multiColorThreshVid: /usr/local/lib/libopencv_imgcodecs.so.3.0.0
multiColorThreshVid: /usr/local/lib/libopencv_highgui.so.3.0.0
multiColorThreshVid: /usr/local/lib/libopencv_flann.so.3.0.0
multiColorThreshVid: /usr/local/lib/libopencv_features2d.so.3.0.0
multiColorThreshVid: /usr/local/lib/libopencv_core.so.3.0.0
multiColorThreshVid: /usr/local/lib/libopencv_calib3d.so.3.0.0
multiColorThreshVid: /usr/local/lib/libopencv_features2d.so.3.0.0
multiColorThreshVid: /usr/local/lib/libopencv_ml.so.3.0.0
multiColorThreshVid: /usr/local/lib/libopencv_highgui.so.3.0.0
multiColorThreshVid: /usr/local/lib/libopencv_videoio.so.3.0.0
multiColorThreshVid: /usr/local/lib/libopencv_imgcodecs.so.3.0.0
multiColorThreshVid: /usr/local/lib/libopencv_flann.so.3.0.0
multiColorThreshVid: /usr/local/lib/libopencv_video.so.3.0.0
multiColorThreshVid: /usr/local/lib/libopencv_imgproc.so.3.0.0
multiColorThreshVid: /usr/local/lib/libopencv_core.so.3.0.0
multiColorThreshVid: CMakeFiles/multiColorThreshVid.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable multiColorThreshVid"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/multiColorThreshVid.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/multiColorThreshVid.dir/build: multiColorThreshVid
.PHONY : CMakeFiles/multiColorThreshVid.dir/build

CMakeFiles/multiColorThreshVid.dir/requires: CMakeFiles/multiColorThreshVid.dir/multiColorThreshVid.cpp.o.requires
.PHONY : CMakeFiles/multiColorThreshVid.dir/requires

CMakeFiles/multiColorThreshVid.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/multiColorThreshVid.dir/cmake_clean.cmake
.PHONY : CMakeFiles/multiColorThreshVid.dir/clean

CMakeFiles/multiColorThreshVid.dir/depend:
	cd /home/odroid/CV/b4Sight/Research/multiColorThresh/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/odroid/CV/b4Sight/Research/multiColorThresh /home/odroid/CV/b4Sight/Research/multiColorThresh /home/odroid/CV/b4Sight/Research/multiColorThresh/build /home/odroid/CV/b4Sight/Research/multiColorThresh/build /home/odroid/CV/b4Sight/Research/multiColorThresh/build/CMakeFiles/multiColorThreshVid.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/multiColorThreshVid.dir/depend
