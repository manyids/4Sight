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
CMAKE_SOURCE_DIR = /home/odroid/CV/b4Sight/Tools/neonAsmGray

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/odroid/CV/b4Sight/Tools/neonAsmGray/build

# Include any dependencies generated for this target.
include CMakeFiles/neonAsmGrayVid.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/neonAsmGrayVid.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/neonAsmGrayVid.dir/flags.make

CMakeFiles/neonAsmGrayVid.dir/neonAsmGrayVid.cpp.o: CMakeFiles/neonAsmGrayVid.dir/flags.make
CMakeFiles/neonAsmGrayVid.dir/neonAsmGrayVid.cpp.o: ../neonAsmGrayVid.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/odroid/CV/b4Sight/Tools/neonAsmGray/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/neonAsmGrayVid.dir/neonAsmGrayVid.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/neonAsmGrayVid.dir/neonAsmGrayVid.cpp.o -c /home/odroid/CV/b4Sight/Tools/neonAsmGray/neonAsmGrayVid.cpp

CMakeFiles/neonAsmGrayVid.dir/neonAsmGrayVid.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/neonAsmGrayVid.dir/neonAsmGrayVid.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/odroid/CV/b4Sight/Tools/neonAsmGray/neonAsmGrayVid.cpp > CMakeFiles/neonAsmGrayVid.dir/neonAsmGrayVid.cpp.i

CMakeFiles/neonAsmGrayVid.dir/neonAsmGrayVid.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/neonAsmGrayVid.dir/neonAsmGrayVid.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/odroid/CV/b4Sight/Tools/neonAsmGray/neonAsmGrayVid.cpp -o CMakeFiles/neonAsmGrayVid.dir/neonAsmGrayVid.cpp.s

CMakeFiles/neonAsmGrayVid.dir/neonAsmGrayVid.cpp.o.requires:
.PHONY : CMakeFiles/neonAsmGrayVid.dir/neonAsmGrayVid.cpp.o.requires

CMakeFiles/neonAsmGrayVid.dir/neonAsmGrayVid.cpp.o.provides: CMakeFiles/neonAsmGrayVid.dir/neonAsmGrayVid.cpp.o.requires
	$(MAKE) -f CMakeFiles/neonAsmGrayVid.dir/build.make CMakeFiles/neonAsmGrayVid.dir/neonAsmGrayVid.cpp.o.provides.build
.PHONY : CMakeFiles/neonAsmGrayVid.dir/neonAsmGrayVid.cpp.o.provides

CMakeFiles/neonAsmGrayVid.dir/neonAsmGrayVid.cpp.o.provides.build: CMakeFiles/neonAsmGrayVid.dir/neonAsmGrayVid.cpp.o

# Object files for target neonAsmGrayVid
neonAsmGrayVid_OBJECTS = \
"CMakeFiles/neonAsmGrayVid.dir/neonAsmGrayVid.cpp.o"

# External object files for target neonAsmGrayVid
neonAsmGrayVid_EXTERNAL_OBJECTS =

neonAsmGrayVid: CMakeFiles/neonAsmGrayVid.dir/neonAsmGrayVid.cpp.o
neonAsmGrayVid: CMakeFiles/neonAsmGrayVid.dir/build.make
neonAsmGrayVid: /usr/local/lib/libopencv_videostab.so.3.0.0
neonAsmGrayVid: /usr/local/lib/libopencv_videoio.so.3.0.0
neonAsmGrayVid: /usr/local/lib/libopencv_video.so.3.0.0
neonAsmGrayVid: /usr/local/lib/libopencv_ts.a
neonAsmGrayVid: /usr/local/lib/libopencv_superres.so.3.0.0
neonAsmGrayVid: /usr/local/lib/libopencv_stitching.so.3.0.0
neonAsmGrayVid: /usr/local/lib/libopencv_shape.so.3.0.0
neonAsmGrayVid: /usr/local/lib/libopencv_photo.so.3.0.0
neonAsmGrayVid: /usr/local/lib/libopencv_objdetect.so.3.0.0
neonAsmGrayVid: /usr/local/lib/libopencv_ml.so.3.0.0
neonAsmGrayVid: /usr/local/lib/libopencv_imgproc.so.3.0.0
neonAsmGrayVid: /usr/local/lib/libopencv_imgcodecs.so.3.0.0
neonAsmGrayVid: /usr/local/lib/libopencv_highgui.so.3.0.0
neonAsmGrayVid: /usr/local/lib/libopencv_flann.so.3.0.0
neonAsmGrayVid: /usr/local/lib/libopencv_features2d.so.3.0.0
neonAsmGrayVid: /usr/local/lib/libopencv_core.so.3.0.0
neonAsmGrayVid: /usr/local/lib/libopencv_calib3d.so.3.0.0
neonAsmGrayVid: /usr/local/lib/libopencv_features2d.so.3.0.0
neonAsmGrayVid: /usr/local/lib/libopencv_ml.so.3.0.0
neonAsmGrayVid: /usr/local/lib/libopencv_highgui.so.3.0.0
neonAsmGrayVid: /usr/local/lib/libopencv_videoio.so.3.0.0
neonAsmGrayVid: /usr/local/lib/libopencv_imgcodecs.so.3.0.0
neonAsmGrayVid: /usr/local/lib/libopencv_flann.so.3.0.0
neonAsmGrayVid: /usr/local/lib/libopencv_video.so.3.0.0
neonAsmGrayVid: /usr/local/lib/libopencv_imgproc.so.3.0.0
neonAsmGrayVid: /usr/local/lib/libopencv_core.so.3.0.0
neonAsmGrayVid: CMakeFiles/neonAsmGrayVid.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable neonAsmGrayVid"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/neonAsmGrayVid.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/neonAsmGrayVid.dir/build: neonAsmGrayVid
.PHONY : CMakeFiles/neonAsmGrayVid.dir/build

CMakeFiles/neonAsmGrayVid.dir/requires: CMakeFiles/neonAsmGrayVid.dir/neonAsmGrayVid.cpp.o.requires
.PHONY : CMakeFiles/neonAsmGrayVid.dir/requires

CMakeFiles/neonAsmGrayVid.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/neonAsmGrayVid.dir/cmake_clean.cmake
.PHONY : CMakeFiles/neonAsmGrayVid.dir/clean

CMakeFiles/neonAsmGrayVid.dir/depend:
	cd /home/odroid/CV/b4Sight/Tools/neonAsmGray/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/odroid/CV/b4Sight/Tools/neonAsmGray /home/odroid/CV/b4Sight/Tools/neonAsmGray /home/odroid/CV/b4Sight/Tools/neonAsmGray/build /home/odroid/CV/b4Sight/Tools/neonAsmGray/build /home/odroid/CV/b4Sight/Tools/neonAsmGray/build/CMakeFiles/neonAsmGrayVid.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/neonAsmGrayVid.dir/depend

