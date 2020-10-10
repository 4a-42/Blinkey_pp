cmake_minimum_required(VERSION 3.0.0)

set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR MSP430)


set(toolchain_install_dir "C:/ti/ccs901/ccs/msp430-gcc-8.2.0.52_win64")
set(vendor_include_dir "C:/ti/ccs901/ccs/ccs_base/msp430/include_gcc")

set(CMAKE_C_COMPILER "${toolchain_install_dir}/bin/msp430-elf-gcc.exe")
set(CMAKE_CXX_COMPILER "${toolchain_install_dir}/bin/msp430-elf-gcc.exe")


include_directories(BEFORE SYSTEM "${vendor_include_dir}" "${toolchain_install_dir}/msp430-elf/include")