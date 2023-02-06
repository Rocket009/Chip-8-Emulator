cmake_minimum_required(VERSION 3.0)

project(Chip-8-Emulator)

file(GLOB src "./src/*.c")
file(GLOB incl "./include*.h")
add_executable(Chip-8 ${src})
find_package(SDL2 REQUIRED)
set(CMAKE_BUILD_TYPE Debug)
include_directories(${SDL2_INCLUDE_DIRS})
target_link_libraries(Chip-8 ${SDL2_LIBRARIES})
