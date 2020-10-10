# Blinkey_pp

MSP430 application using c++ toolchain

This project is meant to be used on a MSP-EXP430FR5994.

The goal of this project is to have an example of modern, mainstream c++ tools and features being used in a microcontroller project.

To allow cmake to work nicely with vscode, add this to your cmake-tools-kits.json file:

```json
  {
    "name": "GCC 8.2 for MSP430",
    "compilers": {
      "C": "C:\\ti\\ccs901\\ccs\\msp430-gcc-8.2.0.52_win64\\bin\\msp430-elf-gcc.exe",
      "CXX": "C:\\ti\\ccs901\\ccs\\msp430-gcc-8.2.0.52_win64\\bin\\msp430-elf-gcc.exe"
    },
    "preferredGenerator": {
      "name": "Unix Makefiles",
      "platform": "MSP430"
    }
  }
```


## Installing Dependencies

You will need the following tools:

* [CMake](https://cmake.org/download/)
  * To install on linux, check out <https://www.youtube.com/watch?v=_yFPO1ofyF0>
* A [GCC](http://software-dl.ti.com/msp430/msp430_public_sw/mcu/msp430/MSPGCC/latest/index_FDS.html) cross compiler for the msp430
