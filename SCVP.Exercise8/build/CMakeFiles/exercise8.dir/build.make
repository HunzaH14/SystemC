# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.28

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
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
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/omkar/SCVP.Exercise8

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/omkar/SCVP.Exercise8/build

# Include any dependencies generated for this target.
include CMakeFiles/exercise8.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/exercise8.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/exercise8.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/exercise8.dir/flags.make

CMakeFiles/exercise8.dir/main.cpp.o: CMakeFiles/exercise8.dir/flags.make
CMakeFiles/exercise8.dir/main.cpp.o: /home/omkar/SCVP.Exercise8/main.cpp
CMakeFiles/exercise8.dir/main.cpp.o: CMakeFiles/exercise8.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/omkar/SCVP.Exercise8/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/exercise8.dir/main.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/exercise8.dir/main.cpp.o -MF CMakeFiles/exercise8.dir/main.cpp.o.d -o CMakeFiles/exercise8.dir/main.cpp.o -c /home/omkar/SCVP.Exercise8/main.cpp

CMakeFiles/exercise8.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/exercise8.dir/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/omkar/SCVP.Exercise8/main.cpp > CMakeFiles/exercise8.dir/main.cpp.i

CMakeFiles/exercise8.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/exercise8.dir/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/omkar/SCVP.Exercise8/main.cpp -o CMakeFiles/exercise8.dir/main.cpp.s

CMakeFiles/exercise8.dir/memory_manager.cpp.o: CMakeFiles/exercise8.dir/flags.make
CMakeFiles/exercise8.dir/memory_manager.cpp.o: /home/omkar/SCVP.Exercise8/memory_manager.cpp
CMakeFiles/exercise8.dir/memory_manager.cpp.o: CMakeFiles/exercise8.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/omkar/SCVP.Exercise8/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/exercise8.dir/memory_manager.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/exercise8.dir/memory_manager.cpp.o -MF CMakeFiles/exercise8.dir/memory_manager.cpp.o.d -o CMakeFiles/exercise8.dir/memory_manager.cpp.o -c /home/omkar/SCVP.Exercise8/memory_manager.cpp

CMakeFiles/exercise8.dir/memory_manager.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/exercise8.dir/memory_manager.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/omkar/SCVP.Exercise8/memory_manager.cpp > CMakeFiles/exercise8.dir/memory_manager.cpp.i

CMakeFiles/exercise8.dir/memory_manager.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/exercise8.dir/memory_manager.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/omkar/SCVP.Exercise8/memory_manager.cpp -o CMakeFiles/exercise8.dir/memory_manager.cpp.s

# Object files for target exercise8
exercise8_OBJECTS = \
"CMakeFiles/exercise8.dir/main.cpp.o" \
"CMakeFiles/exercise8.dir/memory_manager.cpp.o"

# External object files for target exercise8
exercise8_EXTERNAL_OBJECTS =

exercise8: CMakeFiles/exercise8.dir/main.cpp.o
exercise8: CMakeFiles/exercise8.dir/memory_manager.cpp.o
exercise8: CMakeFiles/exercise8.dir/build.make
exercise8: CMakeFiles/exercise8.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/omkar/SCVP.Exercise8/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable exercise8"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/exercise8.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/exercise8.dir/build: exercise8
.PHONY : CMakeFiles/exercise8.dir/build

CMakeFiles/exercise8.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/exercise8.dir/cmake_clean.cmake
.PHONY : CMakeFiles/exercise8.dir/clean

CMakeFiles/exercise8.dir/depend:
	cd /home/omkar/SCVP.Exercise8/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/omkar/SCVP.Exercise8 /home/omkar/SCVP.Exercise8 /home/omkar/SCVP.Exercise8/build /home/omkar/SCVP.Exercise8/build /home/omkar/SCVP.Exercise8/build/CMakeFiles/exercise8.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/exercise8.dir/depend

