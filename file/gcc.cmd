@set paths=%PATH%
@set PATH=c:\mingw\bin\;c:\fbc\;c:\nasm\;%paths%
@as -o .\tmp\boot.o .\file\boot.s
@gcc -c -nostdlib -o .\tmp\base.o .\file\base.c
@fbc32 -entry MAIN -c -o .\tmp\kernel.o -lib .\tmp\base.o %1
@ld -nostdlib -T .\file\link.ld .\tmp\boot.o .\tmp\base.o .\tmp\kernel.o -o .\tmp\kernel.bin
@objcopy .\tmp\kernel.bin -O elf32-i386  .\tmp\file.bin
@set PATH=%paths%
