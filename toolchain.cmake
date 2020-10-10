cmake_minimum_required(VERSION 3.0.0)

set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR MSP430)


set(toolchain_install_dir "C:/ti/ccs901/ccs/msp430-gcc-8.2.0.52_win64")
set(CMAKE_C_COMPILER "${toolchain_install_dir}/bin/msp430-elf-gcc.exe")
set(CMAKE_CXX_COMPILER "${toolchain_install_dir}/bin/msp430-elf-gcc.exe")
