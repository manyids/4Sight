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
CMAKE_SOURCE_DIR = /home/odroid/CV/b4Sight/Basic/camVid

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/odroid/CV/b4Sight/Basic/camVid

# Include any dependencies generated for this target.
include CMakeFiles/camVid.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/camVid.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/camVid.dir/flags.make

CMakeFiles/camVid.dir/camVid.cpp.o: CMakeFiles/camVid.dir/flags.make
CMakeFiles/camVid.dir/camVid.cpp.o: camVid.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/odroid/CV/b4Sight/Basic/camVid/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/camVid.dir/camVid.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/camVid.dir/camVid.cpp.o -c /home/odroid/CV/b4Sight/Basic/camVid/camVid.cpp

CMakeFiles/camVid.dir/camVid.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/camVid.dir/camVid.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/odroid/CV/b4Sight/Basic/camVid/camVid.cpp > CMakeFiles/camVid.dir/camVid.cpp.i

CMakeFiles/camVid.dir/camVid.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/camVid.dir/camVid.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/odroid/CV/b4Sight/Basic/camVid/camVid.cpp -o CMakeFiles/camVid.dir/camVid.cpp.s

CMakeFiles/camVid.dir/camVid.cpp.o.requires:
.PHONY : CMakeFiles/camVid.dir/camVid.cpp.o.requires

CMakeFiles/camVid.dir/camVid.cpp.o.provides: CMakeFiles/camVid.dir/camVid.cpp.o.requires
	$(MAKE) -f CMakeFiles/camVid.dir/build.make CMakeFiles/camVid.dir/camVid.cpp.o.provides.build
.PHONY : CMakeFiles/camVid.dir/camVid.cpp.o.provides

CMakeFiles/camVid.dir/camVid.cpp.o.provides.build: CMakeFiles/camVid.dir/camVid.cpp.o

# Object files for target camVid
camVid_OBJECTS = \
"CMakeFiles/camVid.dir/camVid.cpp.o"

# External object files for target camVid
camVid_EXTERNAL_OBJECTS =

camVid: CMakeFiles/camVid.dir/camVid.cpp.o
camVid: CMakeFiles/camVid.dir/build.make
camVid: /usr/local/lib/libopencv_videostab.so.3.0.0
camVid: /usr/local/lib/libopencv_videoio.so.3.0.0
camVid: /usr/local/lib/libopencv_video.so.3.0.0
camVid: /usr/local/lib/libopencv_ts.a
camVid: /usr/local/lib/libopencv_superres.so.3.0.0
camVid: /usr/local/lib/libopencv_stitching.so.3.0.0
camVid: /usr/local/lib/libopencv_shape.so.3.0.0
camVid: /usr/local/lib/libopencv_photo.so.3.0.0
camVid: /usr/local/lib/libopencv_objdetect.so.3.0.0
camVid: /usr/local/lib/libopencv_ml.so.3.0.0
camVid: /usr/local/lib/libopencv_imgproc.so.3.0.0
camVid: /usr/local/lib/libopencv_imgcodecs.so.3.0.0
camVid: /usr/local/lib/libopencv_highgui.so.3.0.0
camVid: /usr/local/lib/libopencv_flann.so.3.0.0
camVid: /usr/local/lib/libopencv_features2d.so.3.0.0
camVid: /usr/local/lib/libopencv_core.so.3.0.0
camVid: /usr/local/lib/libopencv_calib3d.so.3.0.0
camVid: /usr/local/lib/libopencv_features2d.so.3.0.0
camVid: /usr/local/lib/libopencv_ml.so.3.0.0
camVid: /usr/local/lib/libopencv_highgui.so.3.0.0
camVid: /usr/local/lib/libopencv_videoio.so.3.0.0
camVid: /usr/local/lib/libopencv_imgcodecs.so.3.0.0
camVid: /usr/local/lib/libopencv_flann.so.3.0.0
camVid: /usr/local/lib/libopencv_video.so.3.0.0
camVid: /usr/local/lib/libopencv_imgproc.so.3.0.0
camVid: /usr/local/lib/libopencv_core.so.3.0.0
camVid: CMakeFiles/camVid.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable camVid"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/camVid.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/camVid.dir/build: camVid
.PHONY : CMakeFiles/camVid.dir/build

CMakeFiles/camVid.dir/requires: CMakeFiles/camVid.dir/camVid.cpp.o.requires
.PHONY : CMakeFiles/camVid.dir/requires

CMakeFiles/camVid.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/camVid.dir/cmake_clean.cmake
.PHONY : CMakeFiles/camVid.dir/clean

CMakeFiles/camVid.dir/depend:
	cd /home/odroid/CV/b4Sight/Basic/camVid && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/odroid/CV/b4Sight/Basic/camVid /home/odroid/CV/b4Sight/Basic/camVid /home/odroid/CV/b4Sight/Basic/camVid /home/odroid/CV/b4Sight/Basic/camVid /home/odroid/CV/b4Sight/Basic/camVid/CMakeFiles/camVid.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/camVid.dir/depend

