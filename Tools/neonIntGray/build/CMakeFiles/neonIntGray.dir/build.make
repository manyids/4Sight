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
CMAKE_SOURCE_DIR = /home/odroid/CV/b4Sight/Tools/neonIntGray

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/odroid/CV/b4Sight/Tools/neonIntGray/build

# Include any dependencies generated for this target.
include CMakeFiles/neonIntGray.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/neonIntGray.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/neonIntGray.dir/flags.make

CMakeFiles/neonIntGray.dir/neonIntGray.cpp.o: CMakeFiles/neonIntGray.dir/flags.make
CMakeFiles/neonIntGray.dir/neonIntGray.cpp.o: ../neonIntGray.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/odroid/CV/b4Sight/Tools/neonIntGray/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/neonIntGray.dir/neonIntGray.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/neonIntGray.dir/neonIntGray.cpp.o -c /home/odroid/CV/b4Sight/Tools/neonIntGray/neonIntGray.cpp

CMakeFiles/neonIntGray.dir/neonIntGray.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/neonIntGray.dir/neonIntGray.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/odroid/CV/b4Sight/Tools/neonIntGray/neonIntGray.cpp > CMakeFiles/neonIntGray.dir/neonIntGray.cpp.i

CMakeFiles/neonIntGray.dir/neonIntGray.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/neonIntGray.dir/neonIntGray.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/odroid/CV/b4Sight/Tools/neonIntGray/neonIntGray.cpp -o CMakeFiles/neonIntGray.dir/neonIntGray.cpp.s

CMakeFiles/neonIntGray.dir/neonIntGray.cpp.o.requires:
.PHONY : CMakeFiles/neonIntGray.dir/neonIntGray.cpp.o.requires

CMakeFiles/neonIntGray.dir/neonIntGray.cpp.o.provides: CMakeFiles/neonIntGray.dir/neonIntGray.cpp.o.requires
	$(MAKE) -f CMakeFiles/neonIntGray.dir/build.make CMakeFiles/neonIntGray.dir/neonIntGray.cpp.o.provides.build
.PHONY : CMakeFiles/neonIntGray.dir/neonIntGray.cpp.o.provides

CMakeFiles/neonIntGray.dir/neonIntGray.cpp.o.provides.build: CMakeFiles/neonIntGray.dir/neonIntGray.cpp.o

# Object files for target neonIntGray
neonIntGray_OBJECTS = \
"CMakeFiles/neonIntGray.dir/neonIntGray.cpp.o"

# External object files for target neonIntGray
neonIntGray_EXTERNAL_OBJECTS =

neonIntGray: CMakeFiles/neonIntGray.dir/neonIntGray.cpp.o
neonIntGray: CMakeFiles/neonIntGray.dir/build.make
neonIntGray: /usr/local/lib/libopencv_videostab.so.3.0.0
neonIntGray: /usr/local/lib/libopencv_videoio.so.3.0.0
neonIntGray: /usr/local/lib/libopencv_video.so.3.0.0
neonIntGray: /usr/local/lib/libopencv_ts.a
neonIntGray: /usr/local/lib/libopencv_superres.so.3.0.0
neonIntGray: /usr/local/lib/libopencv_stitching.so.3.0.0
neonIntGray: /usr/local/lib/libopencv_shape.so.3.0.0
neonIntGray: /usr/local/lib/libopencv_photo.so.3.0.0
neonIntGray: /usr/local/lib/libopencv_objdetect.so.3.0.0
neonIntGray: /usr/local/lib/libopencv_ml.so.3.0.0
neonIntGray: /usr/local/lib/libopencv_imgproc.so.3.0.0
neonIntGray: /usr/local/lib/libopencv_imgcodecs.so.3.0.0
neonIntGray: /usr/local/lib/libopencv_highgui.so.3.0.0
neonIntGray: /usr/local/lib/libopencv_flann.so.3.0.0
neonIntGray: /usr/local/lib/libopencv_features2d.so.3.0.0
neonIntGray: /usr/local/lib/libopencv_core.so.3.0.0
neonIntGray: /usr/local/lib/libopencv_calib3d.so.3.0.0
neonIntGray: /usr/local/lib/libopencv_features2d.so.3.0.0
neonIntGray: /usr/local/lib/libopencv_ml.so.3.0.0
neonIntGray: /usr/local/lib/libopencv_highgui.so.3.0.0
neonIntGray: /usr/local/lib/libopencv_videoio.so.3.0.0
neonIntGray: /usr/local/lib/libopencv_imgcodecs.so.3.0.0
neonIntGray: /usr/local/lib/libopencv_flann.so.3.0.0
neonIntGray: /usr/local/lib/libopencv_video.so.3.0.0
neonIntGray: /usr/local/lib/libopencv_imgproc.so.3.0.0
neonIntGray: /usr/local/lib/libopencv_core.so.3.0.0
neonIntGray: CMakeFiles/neonIntGray.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable neonIntGray"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/neonIntGray.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/neonIntGray.dir/build: neonIntGray
.PHONY : CMakeFiles/neonIntGray.dir/build

CMakeFiles/neonIntGray.dir/requires: CMakeFiles/neonIntGray.dir/neonIntGray.cpp.o.requires
.PHONY : CMakeFiles/neonIntGray.dir/requires

CMakeFiles/neonIntGray.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/neonIntGray.dir/cmake_clean.cmake
.PHONY : CMakeFiles/neonIntGray.dir/clean

CMakeFiles/neonIntGray.dir/depend:
	cd /home/odroid/CV/b4Sight/Tools/neonIntGray/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/odroid/CV/b4Sight/Tools/neonIntGray /home/odroid/CV/b4Sight/Tools/neonIntGray /home/odroid/CV/b4Sight/Tools/neonIntGray/build /home/odroid/CV/b4Sight/Tools/neonIntGray/build /home/odroid/CV/b4Sight/Tools/neonIntGray/build/CMakeFiles/neonIntGray.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/neonIntGray.dir/depend

