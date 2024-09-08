cmake_minimum_required(VERSION 3.10)

# Project name
project(MyCalcProject)

# Set C++ standard
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Include header files from Core and Modules
include_directories(Core/include)
include_directories(modules/Add/include)
include_directories(modules/Sub/include)
include_directories(modules/Mul/include)
include_directories(modules/Div/include)

# Add subdirectories for core and modules
add_subdirectory(Core)
add_subdirectory(modules/Add)
add_subdirectory(modules/Sub)
add_subdirectory(modules/Mul)
add_subdirectory(modules/Div)

# Set output directories for executables and libraries
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/hex)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/hex)
