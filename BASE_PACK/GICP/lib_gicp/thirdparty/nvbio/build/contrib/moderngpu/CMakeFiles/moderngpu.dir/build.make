# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.18

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
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/root/Workspace-IISMN/ROS-BASE/NvBIO/nvbio

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/root/Workspace-IISMN/ROS-BASE/NvBIO/nvbio/build

# Include any dependencies generated for this target.
include contrib/moderngpu/CMakeFiles/moderngpu.dir/depend.make

# Include the progress variables for this target.
include contrib/moderngpu/CMakeFiles/moderngpu.dir/progress.make

# Include the compile flags for this target's objects.
include contrib/moderngpu/CMakeFiles/moderngpu.dir/flags.make

contrib/moderngpu/CMakeFiles/moderngpu.dir/src/moderngpu_generated_mgpucontext.cu.o: contrib/moderngpu/CMakeFiles/moderngpu.dir/src/moderngpu_generated_mgpucontext.cu.o.depend
contrib/moderngpu/CMakeFiles/moderngpu.dir/src/moderngpu_generated_mgpucontext.cu.o: contrib/moderngpu/CMakeFiles/moderngpu.dir/src/moderngpu_generated_mgpucontext.cu.o.Release.cmake
contrib/moderngpu/CMakeFiles/moderngpu.dir/src/moderngpu_generated_mgpucontext.cu.o: ../contrib/moderngpu/src/mgpucontext.cu
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/root/Workspace-IISMN/ROS-BASE/NvBIO/nvbio/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building NVCC (Device) object contrib/moderngpu/CMakeFiles/moderngpu.dir/src/moderngpu_generated_mgpucontext.cu.o"
	cd /home/root/Workspace-IISMN/ROS-BASE/NvBIO/nvbio/build/contrib/moderngpu/CMakeFiles/moderngpu.dir/src && /usr/local/bin/cmake -E make_directory /home/root/Workspace-IISMN/ROS-BASE/NvBIO/nvbio/build/contrib/moderngpu/CMakeFiles/moderngpu.dir/src/.
	cd /home/root/Workspace-IISMN/ROS-BASE/NvBIO/nvbio/build/contrib/moderngpu/CMakeFiles/moderngpu.dir/src && /usr/local/bin/cmake -D verbose:BOOL=$(VERBOSE) -D build_configuration:STRING=Release -D generated_file:STRING=/home/root/Workspace-IISMN/ROS-BASE/NvBIO/nvbio/build/contrib/moderngpu/CMakeFiles/moderngpu.dir/src/./moderngpu_generated_mgpucontext.cu.o -D generated_cubin_file:STRING=/home/root/Workspace-IISMN/ROS-BASE/NvBIO/nvbio/build/contrib/moderngpu/CMakeFiles/moderngpu.dir/src/./moderngpu_generated_mgpucontext.cu.o.cubin.txt -P /home/root/Workspace-IISMN/ROS-BASE/NvBIO/nvbio/build/contrib/moderngpu/CMakeFiles/moderngpu.dir/src/moderngpu_generated_mgpucontext.cu.o.Release.cmake

contrib/moderngpu/CMakeFiles/moderngpu.dir/src/mgpuutil.cpp.o: contrib/moderngpu/CMakeFiles/moderngpu.dir/flags.make
contrib/moderngpu/CMakeFiles/moderngpu.dir/src/mgpuutil.cpp.o: ../contrib/moderngpu/src/mgpuutil.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/root/Workspace-IISMN/ROS-BASE/NvBIO/nvbio/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object contrib/moderngpu/CMakeFiles/moderngpu.dir/src/mgpuutil.cpp.o"
	cd /home/root/Workspace-IISMN/ROS-BASE/NvBIO/nvbio/build/contrib/moderngpu && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/moderngpu.dir/src/mgpuutil.cpp.o -c /home/root/Workspace-IISMN/ROS-BASE/NvBIO/nvbio/contrib/moderngpu/src/mgpuutil.cpp

contrib/moderngpu/CMakeFiles/moderngpu.dir/src/mgpuutil.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/moderngpu.dir/src/mgpuutil.cpp.i"
	cd /home/root/Workspace-IISMN/ROS-BASE/NvBIO/nvbio/build/contrib/moderngpu && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/root/Workspace-IISMN/ROS-BASE/NvBIO/nvbio/contrib/moderngpu/src/mgpuutil.cpp > CMakeFiles/moderngpu.dir/src/mgpuutil.cpp.i

contrib/moderngpu/CMakeFiles/moderngpu.dir/src/mgpuutil.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/moderngpu.dir/src/mgpuutil.cpp.s"
	cd /home/root/Workspace-IISMN/ROS-BASE/NvBIO/nvbio/build/contrib/moderngpu && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/root/Workspace-IISMN/ROS-BASE/NvBIO/nvbio/contrib/moderngpu/src/mgpuutil.cpp -o CMakeFiles/moderngpu.dir/src/mgpuutil.cpp.s

contrib/moderngpu/CMakeFiles/moderngpu.dir/src/mmio.cpp.o: contrib/moderngpu/CMakeFiles/moderngpu.dir/flags.make
contrib/moderngpu/CMakeFiles/moderngpu.dir/src/mmio.cpp.o: ../contrib/moderngpu/src/mmio.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/root/Workspace-IISMN/ROS-BASE/NvBIO/nvbio/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object contrib/moderngpu/CMakeFiles/moderngpu.dir/src/mmio.cpp.o"
	cd /home/root/Workspace-IISMN/ROS-BASE/NvBIO/nvbio/build/contrib/moderngpu && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/moderngpu.dir/src/mmio.cpp.o -c /home/root/Workspace-IISMN/ROS-BASE/NvBIO/nvbio/contrib/moderngpu/src/mmio.cpp

contrib/moderngpu/CMakeFiles/moderngpu.dir/src/mmio.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/moderngpu.dir/src/mmio.cpp.i"
	cd /home/root/Workspace-IISMN/ROS-BASE/NvBIO/nvbio/build/contrib/moderngpu && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/root/Workspace-IISMN/ROS-BASE/NvBIO/nvbio/contrib/moderngpu/src/mmio.cpp > CMakeFiles/moderngpu.dir/src/mmio.cpp.i

contrib/moderngpu/CMakeFiles/moderngpu.dir/src/mmio.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/moderngpu.dir/src/mmio.cpp.s"
	cd /home/root/Workspace-IISMN/ROS-BASE/NvBIO/nvbio/build/contrib/moderngpu && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/root/Workspace-IISMN/ROS-BASE/NvBIO/nvbio/contrib/moderngpu/src/mmio.cpp -o CMakeFiles/moderngpu.dir/src/mmio.cpp.s

contrib/moderngpu/CMakeFiles/moderngpu.dir/src/sparsematrix.cpp.o: contrib/moderngpu/CMakeFiles/moderngpu.dir/flags.make
contrib/moderngpu/CMakeFiles/moderngpu.dir/src/sparsematrix.cpp.o: ../contrib/moderngpu/src/sparsematrix.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/root/Workspace-IISMN/ROS-BASE/NvBIO/nvbio/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object contrib/moderngpu/CMakeFiles/moderngpu.dir/src/sparsematrix.cpp.o"
	cd /home/root/Workspace-IISMN/ROS-BASE/NvBIO/nvbio/build/contrib/moderngpu && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/moderngpu.dir/src/sparsematrix.cpp.o -c /home/root/Workspace-IISMN/ROS-BASE/NvBIO/nvbio/contrib/moderngpu/src/sparsematrix.cpp

contrib/moderngpu/CMakeFiles/moderngpu.dir/src/sparsematrix.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/moderngpu.dir/src/sparsematrix.cpp.i"
	cd /home/root/Workspace-IISMN/ROS-BASE/NvBIO/nvbio/build/contrib/moderngpu && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/root/Workspace-IISMN/ROS-BASE/NvBIO/nvbio/contrib/moderngpu/src/sparsematrix.cpp > CMakeFiles/moderngpu.dir/src/sparsematrix.cpp.i

contrib/moderngpu/CMakeFiles/moderngpu.dir/src/sparsematrix.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/moderngpu.dir/src/sparsematrix.cpp.s"
	cd /home/root/Workspace-IISMN/ROS-BASE/NvBIO/nvbio/build/contrib/moderngpu && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/root/Workspace-IISMN/ROS-BASE/NvBIO/nvbio/contrib/moderngpu/src/sparsematrix.cpp -o CMakeFiles/moderngpu.dir/src/sparsematrix.cpp.s

# Object files for target moderngpu
moderngpu_OBJECTS = \
"CMakeFiles/moderngpu.dir/src/mgpuutil.cpp.o" \
"CMakeFiles/moderngpu.dir/src/mmio.cpp.o" \
"CMakeFiles/moderngpu.dir/src/sparsematrix.cpp.o"

# External object files for target moderngpu
moderngpu_EXTERNAL_OBJECTS = \
"/home/root/Workspace-IISMN/ROS-BASE/NvBIO/nvbio/build/contrib/moderngpu/CMakeFiles/moderngpu.dir/src/moderngpu_generated_mgpucontext.cu.o"

contrib/moderngpu/libmoderngpu.a: contrib/moderngpu/CMakeFiles/moderngpu.dir/src/mgpuutil.cpp.o
contrib/moderngpu/libmoderngpu.a: contrib/moderngpu/CMakeFiles/moderngpu.dir/src/mmio.cpp.o
contrib/moderngpu/libmoderngpu.a: contrib/moderngpu/CMakeFiles/moderngpu.dir/src/sparsematrix.cpp.o
contrib/moderngpu/libmoderngpu.a: contrib/moderngpu/CMakeFiles/moderngpu.dir/src/moderngpu_generated_mgpucontext.cu.o
contrib/moderngpu/libmoderngpu.a: contrib/moderngpu/CMakeFiles/moderngpu.dir/build.make
contrib/moderngpu/libmoderngpu.a: contrib/moderngpu/CMakeFiles/moderngpu.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/root/Workspace-IISMN/ROS-BASE/NvBIO/nvbio/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking CXX static library libmoderngpu.a"
	cd /home/root/Workspace-IISMN/ROS-BASE/NvBIO/nvbio/build/contrib/moderngpu && $(CMAKE_COMMAND) -P CMakeFiles/moderngpu.dir/cmake_clean_target.cmake
	cd /home/root/Workspace-IISMN/ROS-BASE/NvBIO/nvbio/build/contrib/moderngpu && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/moderngpu.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
contrib/moderngpu/CMakeFiles/moderngpu.dir/build: contrib/moderngpu/libmoderngpu.a

.PHONY : contrib/moderngpu/CMakeFiles/moderngpu.dir/build

contrib/moderngpu/CMakeFiles/moderngpu.dir/clean:
	cd /home/root/Workspace-IISMN/ROS-BASE/NvBIO/nvbio/build/contrib/moderngpu && $(CMAKE_COMMAND) -P CMakeFiles/moderngpu.dir/cmake_clean.cmake
.PHONY : contrib/moderngpu/CMakeFiles/moderngpu.dir/clean

contrib/moderngpu/CMakeFiles/moderngpu.dir/depend: contrib/moderngpu/CMakeFiles/moderngpu.dir/src/moderngpu_generated_mgpucontext.cu.o
	cd /home/root/Workspace-IISMN/ROS-BASE/NvBIO/nvbio/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/root/Workspace-IISMN/ROS-BASE/NvBIO/nvbio /home/root/Workspace-IISMN/ROS-BASE/NvBIO/nvbio/contrib/moderngpu /home/root/Workspace-IISMN/ROS-BASE/NvBIO/nvbio/build /home/root/Workspace-IISMN/ROS-BASE/NvBIO/nvbio/build/contrib/moderngpu /home/root/Workspace-IISMN/ROS-BASE/NvBIO/nvbio/build/contrib/moderngpu/CMakeFiles/moderngpu.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : contrib/moderngpu/CMakeFiles/moderngpu.dir/depend
