cmake_minimum_required(VERSION 3.10.0)
project(blinky++ VERSION 0.0.0)

include(PrintVariables.cmake)
printvariables()

include(CTest)
enable_testing()

add_executable(blinky++.elf source/main.cpp)

# target_compile_definitions(blinky++ PRIVATE __MSP430FR5994__)
target_compile_options(blinky++.elf PRIVATE -mmcu=msp430fr5994 -mhwmult=f5series -fno-exceptions -mlarge -mcode-region=none -mdata-region=none -ggdb3 -gdwarf-4)
set_target_properties(blinky++.elf PROPERTIES LINK_DEPENDS "${vendor_include_dir}/msp430fr5994.ld;${vendor_include_dir}/msp430fr5994_symbols.ld")
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -mhwmult=f5series -fno-exceptions -L ${vendor_include_dir} -T ${vendor_include_dir}/msp430fr5994.ld  -mlarge -mdata-region=none -Wl,-Map,blinky++.map -Wl,--gc-sections -Wl,--start-group -lgcc -lc -Wl,--end-group")

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)
