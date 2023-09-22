/* declare constants for the multiboot header */
.set ALIGN,    1<<0             /* align loaded modules on page boundaries */
.set MEMINFO,  1<<1             /* provide memory map */
.set FLAGS,    ALIGN | MEMINFO  /* this is the Multiboot 'flag' field */
.set MAGIC,    0x1BADB002       /* 'magic number' lets bootloader find the header */
.set CHECKSUM, -(MAGIC + FLAGS) /* checksum of above, to prove we are multiboot */

/* multiboot header that marks the kernel as compliant with version 1.0 of the
specification; the header is aligned on a 4-byte boundary, and is contained
within the first 8192 bytes of the kernel image */
.section .multiboot
.align 4
.long MAGIC
.long FLAGS
.long CHECKSUM

/* multiboot standard does not define the value of stack pointer at entry
allocate a stack and set the stack pointer to the top of the stack
stack grows downwards on x86
should be aligned on a 16-byte boundary by SysV ABI standard */
.section .bss
.align 16
stack_bottom:
.skip 16384 /* 16 KiB */
stack_top:

/* kernel entry point
linker script sets the entry point to this _start */
.section .text
.global _start
.type _start, @function
_start:
    /* 32-bit protected mode on x86 machine
    interrpts and paging disabled
    kernel has full access to cpu and memory. has to do everything itself
    no printf, no stdlib, no libc
    no security, no memory protection, no debugging

    set up the stack pointer */
    mov $stack_top, %esp
    
    /* this is where we should init crucial processor stuff
    interrupts, paging
    c++ features like constructors, exceptions
    we don't have any of that yet, so we just jump to the kernel main

    the ABI requires that the stack is 16-byte aligned before calling a function
    we don't have any function calls yet, so we don't need to worry about that
    but we will need to worry about that later */
    call kernel_main

    /* nothing else to do
    put into an infinite loop
    disable interrupts with cli. already disabled, but just in case
    we enable interrupts later
    wait for an interrupt with hlt. this will put the cpu into a low power state
    and wait for an interrupt to wake it up. 
    interrupts are disabled, so this will be an infinite loop
    if we don't disable interrupts, the cpu will wake up from hlt as soon as an
    interrupt occurs
    jump to hlt if it wakes up due to a non-maskable interrupt
    or due to system management mode */
    cli
1:  hlt
    jmp 1b

/* set the size of the start symbol to the current location '.' minus the start
useful when debugging or implementing call tracing */
.size _start, . - _start


    

