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
CMAKE_SOURCE_DIR = /home/odroid/CV/b4Sight/Tools/testVid

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/odroid/CV/b4Sight/Tools/testVid

# Include any dependencies generated for this target.
include CMakeFiles/testVid.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/testVid.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/testVid.dir/flags.make

CMakeFiles/testVid.dir/testVid.cpp.o: CMakeFiles/testVid.dir/flags.make
CMakeFiles/testVid.dir/testVid.cpp.o: testVid.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/odroid/CV/b4Sight/Tools/testVid/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/testVid.dir/testVid.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/testVid.dir/testVid.cpp.o -c /home/odroid/CV/b4Sight/Tools/testVid/testVid.cpp

CMakeFiles/testVid.dir/testVid.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/testVid.dir/testVid.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/odroid/CV/b4Sight/Tools/testVid/testVid.cpp > CMakeFiles/testVid.dir/testVid.cpp.i

CMakeFiles/testVid.dir/testVid.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/testVid.dir/testVid.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/odroid/CV/b4Sight/Tools/testVid/testVid.cpp -o CMakeFiles/testVid.dir/testVid.cpp.s

CMakeFiles/testVid.dir/testVid.cpp.o.requires:
.PHONY : CMakeFiles/testVid.dir/testVid.cpp.o.requires

CMakeFiles/testVid.dir/testVid.cpp.o.provides: CMakeFiles/testVid.dir/testVid.cpp.o.requires
	$(MAKE) -f CMakeFiles/testVid.dir/build.make CMakeFiles/testVid.dir/testVid.cpp.o.provides.build
.PHONY : CMakeFiles/testVid.dir/testVid.cpp.o.provides

CMakeFiles/testVid.dir/testVid.cpp.o.provides.build: CMakeFiles/testVid.dir/testVid.cpp.o

# Object files for target testVid
testVid_OBJECTS = \
"CMakeFiles/testVid.dir/testVid.cpp.o"

# External object files for target testVid
testVid_EXTERNAL_OBJECTS =

testVid: CMakeFiles/testVid.dir/testVid.cpp.o
testVid: CMakeFiles/testVid.dir/build.make
testVid: /usr/local/lib/libopencv_videostab.so.3.0.0
testVid: /usr/local/lib/libopencv_videoio.so.3.0.0
testVid: /usr/local/lib/libopencv_video.so.3.0.0
testVid: /usr/local/lib/libopencv_ts.a
testVid: /usr/local/lib/libopencv_superres.so.3.0.0
testVid: /usr/local/lib/libopencv_stitching.so.3.0.0
testVid: /usr/local/lib/libopencv_shape.so.3.0.0
testVid: /usr/local/lib/libopencv_photo.so.3.0.0
testVid: /usr/local/lib/libopencv_objdetect.so.3.0.0
testVid: /usr/local/lib/libopencv_ml.so.3.0.0
testVid: /usr/local/lib/libopencv_imgproc.so.3.0.0
testVid: /usr/local/lib/libopencv_imgcodecs.so.3.0.0
testVid: /usr/local/lib/libopencv_highgui.so.3.0.0
testVid: /usr/local/lib/libopencv_flann.so.3.0.0
testVid: /usr/local/lib/libopencv_features2d.so.3.0.0
testVid: /usr/local/lib/libopencv_core.so.3.0.0
testVid: /usr/local/lib/libopencv_calib3d.so.3.0.0
testVid: libfuncs.a
testVid: /usr/local/lib/libopencv_features2d.so.3.0.0
testVid: /usr/local/lib/libopencv_ml.so.3.0.0
testVid: /usr/local/lib/libopencv_highgui.so.3.0.0
testVid: /usr/local/lib/libopencv_videoio.so.3.0.0
testVid: /usr/local/lib/libopencv_imgcodecs.so.3.0.0
testVid: /usr/local/lib/libopencv_flann.so.3.0.0
testVid: /usr/local/lib/libopencv_video.so.3.0.0
testVid: /usr/local/lib/libopencv_imgproc.so.3.0.0
testVid: /usr/local/lib/libopencv_core.so.3.0.0
testVid: CMakeFiles/testVid.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable testVid"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/testVid.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/testVid.dir/build: testVid
.PHONY : CMakeFiles/testVid.dir/build

CMakeFiles/testVid.dir/requires: CMakeFiles/testVid.dir/testVid.cpp.o.requires
.PHONY : CMakeFiles/testVid.dir/requires

CMakeFiles/testVid.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/testVid.dir/cmake_clean.cmake
.PHONY : CMakeFiles/testVid.dir/clean

CMakeFiles/testVid.dir/depend:
	cd /home/odroid/CV/b4Sight/Tools/testVid && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/odroid/CV/b4Sight/Tools/testVid /home/odroid/CV/b4Sight/Tools/testVid /home/odroid/CV/b4Sight/Tools/testVid /home/odroid/CV/b4Sight/Tools/testVid /home/odroid/CV/b4Sight/Tools/testVid/CMakeFiles/testVid.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/testVid.dir/depend

