#!/bin/bash

# Base directory for the project
PROJECT_DIR="MyCalcProject"

# Directories for project structure
SRC_CORE="${PROJECT_DIR}/Core/src"
INC_CORE="${PROJECT_DIR}/Core/include"
SRC_ADD="${PROJECT_DIR}/modules/Add/src"
INC_ADD="${PROJECT_DIR}/modules/Add/include"
SRC_SUB="${PROJECT_DIR}/modules/Sub/src"
INC_SUB="${PROJECT_DIR}/modules/Sub/include"
SRC_MUL="${PROJECT_DIR}/modules/Mul/src"
INC_MUL="${PROJECT_DIR}/modules/Mul/include"
SRC_DIV="${PROJECT_DIR}/modules/Div/src"
INC_DIV="${PROJECT_DIR}/modules/Div/include"
BUILD_DIR="${PROJECT_DIR}/build"

# Create directory structure
echo "Creating project directory structure..."
mkdir -p ${SRC_CORE}
mkdir -p ${INC_CORE}
mkdir -p ${SRC_ADD} ${INC_ADD}
mkdir -p ${SRC_SUB} ${INC_SUB}
mkdir -p ${SRC_MUL} ${INC_MUL}
mkdir -p ${SRC_DIV} ${INC_DIV}
mkdir -p ${BUILD_DIR}

# Main CMakeLists.txt
echo "Generating root CMakeLists.txt..."
cat > ${PROJECT_DIR}/CMakeLists.txt <<EOL
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
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY \${CMAKE_BINARY_DIR}/hex)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY \${CMAKE_BINARY_DIR}/hex)
EOL

# CMakeLists.txt for Core
echo "Generating Core CMakeLists.txt..."
cat > ${PROJECT_DIR}/Core/CMakeLists.txt <<EOL
# Define the executable
add_executable(MyCalcProject src/main.cpp)

# Link with the libraries
target_link_libraries(MyCalcProject add sub mul div)
EOL

# CMakeLists.txt for Add Module
echo "Generating Add module CMakeLists.txt..."
cat > ${PROJECT_DIR}/modules/Add/CMakeLists.txt <<EOL
# Add library for Add module
add_library(add src/add.cpp)
EOL

# CMakeLists.txt for Sub Module
echo "Generating Sub module CMakeLists.txt..."
cat > ${PROJECT_DIR}/modules/Sub/CMakeLists.txt <<EOL
# Add library for Sub module
add_library(sub src/sub.cpp)
EOL

# CMakeLists.txt for Mul Module
echo "Generating Mul module CMakeLists.txt..."
cat > ${PROJECT_DIR}/modules/Mul/CMakeLists.txt <<EOL
# Add library for Mul module
add_library(mul src/mul.cpp)
EOL

# CMakeLists.txt for Div Module
echo "Generating Div module CMakeLists.txt..."
cat > ${PROJECT_DIR}/modules/Div/CMakeLists.txt <<EOL
# Add library for Div module
add_library(div src/div.cpp)
EOL

# Generate the source code for each module
echo "Generating source files for each module..."

# Core main.cpp
cat > ${SRC_CORE}/main.cpp <<EOL
#include <iostream>
#include "main.h"
#include "add.h"
#include "sub.h"
#include "mul.h"
#include "div.h"

int main() {
    int a = 10, b = 5;

    std::cout << "Addition: " << add(a, b) << std::endl;
    std::cout << "Subtraction: " << sub(a, b) << std::endl;
    std::cout << "Multiplication: " << mul(a, b) << std::endl;
    std::cout << "Division: " << div(a, b) << std::endl;

    return 0;
}
EOL

# Core main.h
cat > ${INC_CORE}/main.h <<EOL
#ifndef MAIN_H
#define MAIN_H

// Any global declarations for main can go here

#endif // MAIN_H
EOL

# Add module
cat > ${SRC_ADD}/add.cpp <<EOL
#include "add.h"

int add(int a, int b) {
    return a + b;
}
EOL

cat > ${INC_ADD}/add.h <<EOL
#ifndef ADD_H
#define ADD_H

int add(int a, int b);

#endif // ADD_H
EOL

# Sub module
cat > ${SRC_SUB}/sub.cpp <<EOL
#include "sub.h"

int sub(int a, int b) {
    return a - b;
}
EOL

cat > ${INC_SUB}/sub.h <<EOL
#ifndef SUB_H
#define SUB_H

int sub(int a, int b);

#endif // SUB_H
EOL

# Mul module
cat > ${SRC_MUL}/mul.cpp <<EOL
#include "mul.h"

int mul(int a, int b) {
    return a * b;
}
EOL

cat > ${INC_MUL}/mul.h <<EOL
#ifndef MUL_H
#define MUL_H

int mul(int a, int b);

#endif // MUL_H
EOL

# Div module
cat > ${SRC_DIV}/div.cpp <<EOL
#include "div.h"

int div(int a, int b) {
    return a / b;
}
EOL

cat > ${INC_DIV}/div.h <<EOL
#ifndef DIV_H
#define DIV_H

int div(int a, int b);

#endif // DIV_H
EOL

echo "Project setup is complete!"
