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
  * webfreak.debug
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

* be able to debug
  * How does ccs debugger work? How do I debug with vscode (or command line)?
* correctly link to the c/c++ standard library
  * use standard library without blowing up the size of the executable
  * see if I can use platform-specific and optional parts of the c/c++ stl, like atomic.
  * C:\ti\ccs901\ccs\ccs_base\common\targetdb\options\MSP430FR5964_GNU.xml
* correctly  link to msp430ware library
* try using c++ guidelines support library
* see if clang-tidy works, look into static-analysis
* see if I can get all this to work with the ti compiler too
* see if I can get all this to work with the iar compiler too
* setup cmake for (off-target) unit-testing
* setup cmake for (on-target) unit-testing
* setup CI
* setup cmake for doxygen

### Mistakes/progress

Run C:\ti\msp430-gdbproxy-1.9\msp430-gdbproxy.exe  
TODO: find out which command line arguments to pass to it
when I connect with gdb, I get Protocol error: Expected ACK ('+'), got 0x24 ($) and a bunch of other stuff.  
($=start of packet)  
$qsupported:multiprocess;swbreak;hwbreak;qRelocation;fork-events;vfork-events;exec-events;vContSupported;qThreadEvents;no-resumed#df

let's try using these arguments:
--bpmode=auto --verbose --32bitregs

```cmd
C:\Users\4abus\source\repos\Blinkey_pp\build>"C:\ti\msp430-gcc-8.2.0.52_win64\bin\msp430-elf-gdb.exe" ".\blinky++.elf"
(gdb) target remote :2000  
(gdb) mon erase  
(gdb) load  
(gdb) continue  
Continuing.
```

If you forget the mon erase and load commands, gdb may behave abnormally.
continue works by pressing ctrl+c to stop execution.

Progress:
I seem to be able to debug normally with command line. My mistake was forgetting "mon erase".
Typing "interrupt" in the debug console is what I want to do.

TODO NEXT WEEK:
Remap vscode gdb pause button to do equivalent of typing "interrupt" in gdb console.
target_compile_definitions(blinky++.elf PRIVATE __MSP430FR5994__)
target_compile_options(blinky++.elf PRIVATE -arch=msp430 -mhwmult=f5series -fno-exceptions -mlarge -ggdb3 -gdwarf-4)

### Reference documents

<http://www.ti.com/lit/ml/slau591c/slau591c.pdf>
