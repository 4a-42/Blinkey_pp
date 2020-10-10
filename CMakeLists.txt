cmake_minimum_required(VERSION 3.10.0)
project(blinky++ VERSION 0.0.0)

include(PrintVariables.cmake)
printvariables()

include(CTest)
enable_testing()

add_executable(blinky++ source/main.cpp)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)
