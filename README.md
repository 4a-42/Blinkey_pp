# Blinkey_pp

MSP430 application using c++ toolchain

This project is meant to be used on a MSP-EXP430FR5994.

The goal of this project is to have an example of modern, mainstream c++ tools and features being used in a microcontroller project.




## Installing Dependencies

### Required Tools

* [CMake](https://cmake.org/download/)
  * To install on linux, check out <https://www.youtube.com/watch?v=_yFPO1ofyF0>
* A [GCC](http://software-dl.ti.com/msp430/msp430_public_sw/mcu/msp430/MSPGCC/latest/index_FDS.html) cross compiler for the msp430, and the msp430 header and support files
* [MSP430Ware](http://software-dl.ti.com/msp430/msp430_public_sw/mcu/msp430/MSP430Ware/latest/index_FDS.html)
* <https://github.com/sysprogs/msp430-gdbproxy>
* [MSP Debug Stack](http://www.ti.com/tool/MSPDS)
* might also need this? <http://processors.wiki.ti.com/index.php/XDS_Emulation_Software_Package>

### Optional Tools

* Code Composer Studio
* VSCode
  * ms-vscode.cpptools
  * xaver.clang-format
  * twxs.cmake
  * vector-of-bool.cmake-tools
  * eamodio.gitlens
  * davidanson.vscode-markdownlint
  * ms-python.python
  * 2gua.rainbow-brackets
  * saurabh.terminal-manager
  * vscode-icons-team.vscode-icons
* git
* ninja

To allow cmake to work nicely with vscode, add this to `.vscode/cmake-kits.json`:

```json
[
    {
        "name": "MSP430 GCC 8.2",
        "toolchainFile": "${workspaceFolder}/toolchain.cmake"
    }
]
```

## To-Do List

* check cmake output to see if I still need `PrintVariables.cmake`
* be able to debug
  * workout kinks in compiler/linker flags
    * can I debug with elf (.out) instead of .txt or .hex?
  * How does ccs debugger work? How do I debug with vscode (or command line)?
* correctly link to the c/c++ standard library
  * use standard library without blowing up the size of the executable
  * see if I can use platform-specific and optional parts of the c/c++ stl, like atomic.
* correctly  link to msp430ware library
* try using c++ guidelines support library
* see if clang-tidy works, look into static-analysis
* see if I can get all this to work with the ti compiler too
* see if I can get all this to work with the iar compiler too
* setup cmake for (off-target) unit-testing
* setup CI
* setup cmake for doxygen
