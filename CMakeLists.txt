cmake_minimum_required(VERSION 3.10.0)
project(blinky++ VERSION 0.0.0)

include(PrintVariables.cmake)
printvariables()

include(CTest)
enable_testing()

add_executable(blinky++ source/main.cpp)

target_compile_definitions(blinky++ PRIVATE __MSP430FR5994__)
set_target_properties(blinky++ PROPERTIES LINK_DEPENDS "${vendor_include_dir}/msp430fr5994.ld;${vendor_include_dir}/msp430fr5994_symbols.ld")
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -L ${vendor_include_dir} -T ${vendor_include_dir}/msp430fr5994.ld")

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)
