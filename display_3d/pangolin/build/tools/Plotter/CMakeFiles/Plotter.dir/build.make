# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


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

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/aoberai/programming/python/blind-navigation/display_3d/pangolin

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/aoberai/programming/python/blind-navigation/display_3d/pangolin/build

# Include any dependencies generated for this target.
include tools/Plotter/CMakeFiles/Plotter.dir/depend.make

# Include the progress variables for this target.
include tools/Plotter/CMakeFiles/Plotter.dir/progress.make

# Include the compile flags for this target's objects.
include tools/Plotter/CMakeFiles/Plotter.dir/flags.make

tools/Plotter/CMakeFiles/Plotter.dir/main.cpp.o: tools/Plotter/CMakeFiles/Plotter.dir/flags.make
tools/Plotter/CMakeFiles/Plotter.dir/main.cpp.o: ../tools/Plotter/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/aoberai/programming/python/blind-navigation/display_3d/pangolin/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tools/Plotter/CMakeFiles/Plotter.dir/main.cpp.o"
	cd /home/aoberai/programming/python/blind-navigation/display_3d/pangolin/build/tools/Plotter && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Plotter.dir/main.cpp.o -c /home/aoberai/programming/python/blind-navigation/display_3d/pangolin/tools/Plotter/main.cpp

tools/Plotter/CMakeFiles/Plotter.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Plotter.dir/main.cpp.i"
	cd /home/aoberai/programming/python/blind-navigation/display_3d/pangolin/build/tools/Plotter && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/aoberai/programming/python/blind-navigation/display_3d/pangolin/tools/Plotter/main.cpp > CMakeFiles/Plotter.dir/main.cpp.i

tools/Plotter/CMakeFiles/Plotter.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Plotter.dir/main.cpp.s"
	cd /home/aoberai/programming/python/blind-navigation/display_3d/pangolin/build/tools/Plotter && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/aoberai/programming/python/blind-navigation/display_3d/pangolin/tools/Plotter/main.cpp -o CMakeFiles/Plotter.dir/main.cpp.s

# Object files for target Plotter
Plotter_OBJECTS = \
"CMakeFiles/Plotter.dir/main.cpp.o"

# External object files for target Plotter
Plotter_EXTERNAL_OBJECTS =

tools/Plotter/Plotter: tools/Plotter/CMakeFiles/Plotter.dir/main.cpp.o
tools/Plotter/Plotter: tools/Plotter/CMakeFiles/Plotter.dir/build.make
tools/Plotter/Plotter: src/lib_pangolin.a
tools/Plotter/Plotter: /usr/lib/x86_64-linux-gnu/libGL.so
tools/Plotter/Plotter: /usr/lib/x86_64-linux-gnu/libGLU.so
tools/Plotter/Plotter: /usr/lib/x86_64-linux-gnu/libGLEW.so
tools/Plotter/Plotter: /usr/lib/x86_64-linux-gnu/libSM.so
tools/Plotter/Plotter: /usr/lib/x86_64-linux-gnu/libICE.so
tools/Plotter/Plotter: /usr/lib/x86_64-linux-gnu/libX11.so
tools/Plotter/Plotter: /usr/lib/x86_64-linux-gnu/libXext.so
tools/Plotter/Plotter: /usr/lib/x86_64-linux-gnu/libpython3.8.so
tools/Plotter/Plotter: /usr/lib/x86_64-linux-gnu/libdc1394.so
tools/Plotter/Plotter: /usr/lib/x86_64-linux-gnu/libpng.so
tools/Plotter/Plotter: /usr/lib/x86_64-linux-gnu/libz.so
tools/Plotter/Plotter: /usr/lib/x86_64-linux-gnu/libjpeg.so
tools/Plotter/Plotter: /usr/lib/x86_64-linux-gnu/libtiff.so
tools/Plotter/Plotter: /usr/lib/x86_64-linux-gnu/libIlmImf.so
tools/Plotter/Plotter: tools/Plotter/CMakeFiles/Plotter.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/aoberai/programming/python/blind-navigation/display_3d/pangolin/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable Plotter"
	cd /home/aoberai/programming/python/blind-navigation/display_3d/pangolin/build/tools/Plotter && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Plotter.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tools/Plotter/CMakeFiles/Plotter.dir/build: tools/Plotter/Plotter

.PHONY : tools/Plotter/CMakeFiles/Plotter.dir/build

tools/Plotter/CMakeFiles/Plotter.dir/clean:
	cd /home/aoberai/programming/python/blind-navigation/display_3d/pangolin/build/tools/Plotter && $(CMAKE_COMMAND) -P CMakeFiles/Plotter.dir/cmake_clean.cmake
.PHONY : tools/Plotter/CMakeFiles/Plotter.dir/clean

tools/Plotter/CMakeFiles/Plotter.dir/depend:
	cd /home/aoberai/programming/python/blind-navigation/display_3d/pangolin/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/aoberai/programming/python/blind-navigation/display_3d/pangolin /home/aoberai/programming/python/blind-navigation/display_3d/pangolin/tools/Plotter /home/aoberai/programming/python/blind-navigation/display_3d/pangolin/build /home/aoberai/programming/python/blind-navigation/display_3d/pangolin/build/tools/Plotter /home/aoberai/programming/python/blind-navigation/display_3d/pangolin/build/tools/Plotter/CMakeFiles/Plotter.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tools/Plotter/CMakeFiles/Plotter.dir/depend

