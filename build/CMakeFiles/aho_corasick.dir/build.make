# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.30

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
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.30.2/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.30.2/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/o.halukkarakaya/Desktop/dosyalar/code_2024/data_strctrs_algrthm/Aho-Corasick-Algorithm

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/o.halukkarakaya/Desktop/dosyalar/code_2024/data_strctrs_algrthm/Aho-Corasick-Algorithm/build

# Include any dependencies generated for this target.
include CMakeFiles/aho_corasick.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/aho_corasick.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/aho_corasick.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/aho_corasick.dir/flags.make

CMakeFiles/aho_corasick.dir/main.cpp.o: CMakeFiles/aho_corasick.dir/flags.make
CMakeFiles/aho_corasick.dir/main.cpp.o: /Users/o.halukkarakaya/Desktop/dosyalar/code_2024/data_strctrs_algrthm/Aho-Corasick-Algorithm/main.cpp
CMakeFiles/aho_corasick.dir/main.cpp.o: CMakeFiles/aho_corasick.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/o.halukkarakaya/Desktop/dosyalar/code_2024/data_strctrs_algrthm/Aho-Corasick-Algorithm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/aho_corasick.dir/main.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/aho_corasick.dir/main.cpp.o -MF CMakeFiles/aho_corasick.dir/main.cpp.o.d -o CMakeFiles/aho_corasick.dir/main.cpp.o -c /Users/o.halukkarakaya/Desktop/dosyalar/code_2024/data_strctrs_algrthm/Aho-Corasick-Algorithm/main.cpp

CMakeFiles/aho_corasick.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/aho_corasick.dir/main.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/o.halukkarakaya/Desktop/dosyalar/code_2024/data_strctrs_algrthm/Aho-Corasick-Algorithm/main.cpp > CMakeFiles/aho_corasick.dir/main.cpp.i

CMakeFiles/aho_corasick.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/aho_corasick.dir/main.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/o.halukkarakaya/Desktop/dosyalar/code_2024/data_strctrs_algrthm/Aho-Corasick-Algorithm/main.cpp -o CMakeFiles/aho_corasick.dir/main.cpp.s

# Object files for target aho_corasick
aho_corasick_OBJECTS = \
"CMakeFiles/aho_corasick.dir/main.cpp.o"

# External object files for target aho_corasick
aho_corasick_EXTERNAL_OBJECTS =

aho_corasick: CMakeFiles/aho_corasick.dir/main.cpp.o
aho_corasick: CMakeFiles/aho_corasick.dir/build.make
aho_corasick: CMakeFiles/aho_corasick.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/Users/o.halukkarakaya/Desktop/dosyalar/code_2024/data_strctrs_algrthm/Aho-Corasick-Algorithm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable aho_corasick"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/aho_corasick.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/aho_corasick.dir/build: aho_corasick
.PHONY : CMakeFiles/aho_corasick.dir/build

CMakeFiles/aho_corasick.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/aho_corasick.dir/cmake_clean.cmake
.PHONY : CMakeFiles/aho_corasick.dir/clean

CMakeFiles/aho_corasick.dir/depend:
	cd /Users/o.halukkarakaya/Desktop/dosyalar/code_2024/data_strctrs_algrthm/Aho-Corasick-Algorithm/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/o.halukkarakaya/Desktop/dosyalar/code_2024/data_strctrs_algrthm/Aho-Corasick-Algorithm /Users/o.halukkarakaya/Desktop/dosyalar/code_2024/data_strctrs_algrthm/Aho-Corasick-Algorithm /Users/o.halukkarakaya/Desktop/dosyalar/code_2024/data_strctrs_algrthm/Aho-Corasick-Algorithm/build /Users/o.halukkarakaya/Desktop/dosyalar/code_2024/data_strctrs_algrthm/Aho-Corasick-Algorithm/build /Users/o.halukkarakaya/Desktop/dosyalar/code_2024/data_strctrs_algrthm/Aho-Corasick-Algorithm/build/CMakeFiles/aho_corasick.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/aho_corasick.dir/depend
