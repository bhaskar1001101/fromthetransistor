/* bootloader sees the entry and starts execution at designated point*/
ENTRY(_start)

/* tell it where the various sections
of the object file will be put in the final kernel image*/
SECTIONS
{
    /* start at 1MiB, a conventional place to put the kernel */
    . = 1M;

    /* put the multiboot header first */
    .text BLOCK(4K) : ALIGN(4K)
    {
        *(.multiboot)
        *(.text)
    }

    /* read-only data */
    .rodata BLOCK(4K) : ALIGN(4K)
    {
        *(.rodata)
    }

    /* read-write data (initialized) */
    .data BLOCK(4K) : ALIGN(4K)
    {
        *(.data)
    }

    /* bss */
    /* read write data (unititialized) and stack */
    .bss BLOCK(4K) : ALIGN(4K)
    {
        *(COMMON)
        *(.bss)
    }
    
    /* add more stuff here as needed */
}
