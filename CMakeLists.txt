cmake_minimum_required(VERSION 3.10.0)
project(blinky++ VERSION 0.0.0)

include(PrintVariables.cmake)
printvariables()

include(CTest)
enable_testing()

add_executable(blinky++.elf source/main.cpp)

# temprary workaround for clang
target_compile_definitions(blinky++.elf PRIVATE __MSP430FR5994__)
target_compile_options(blinky++.elf PRIVATE -mmcu=msp430fr5994 -mhwmult=f5series -fno-exceptions -mlarge -mcode-region=none -mdata-region=none -ggdb3 -gdwarf-4)
set_target_properties(blinky++.elf PROPERTIES LINK_DEPENDS "${vendor_include_dir}/msp430fr5994.ld;${vendor_include_dir}/msp430fr5994_symbols.ld")
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -mhwmult=f5series -fno-exceptions -L ${vendor_include_dir} -T ${vendor_include_dir}/msp430fr5994.ld  -mlarge -mdata-region=none -Wl,-Map,blinky++.map -Wl,--gc-sections -Wl,--start-group -lgcc -lc -Wl,--end-group")

find_package (Python REQUIRED COMPONENTS Interpreter)
find_program(
  CLANG_TIDY
  NAMES run-clang-tidy.py
  PATH_SUFFIXES "../share/clang/"
  DOC "Path to run-clang-tidy.py"
  )
if(CLANG_TIDY)
  message(STATUS "clang-tidy found: ${CLANG_TIDY}")
  set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
  set(DO_CLANG_TIDY ${Python_EXECUTABLE} "${CLANG_TIDY}" "-checks=*,-clang-analyzer-alpha.*;header-filter=.;")
  add_custom_target(tidy
              COMMAND ${DO_CLANG_TIDY} .
              USES_TERMINAL
              WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
              COMMENT "WTF why doesn't this work?"
              
  )
else()
  message(STATUS "clang-tidy not found.")
  add_custom_target(tidy COMMAND echo "clang is not installed" USES_TERMINAL)
endif()

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)
