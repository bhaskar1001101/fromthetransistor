#!/bin/sh

if grub-file --is-x86-multiboot myos.bin; then
  echo multiboot confirmed
else
  echo the file is not multiboot
fi

if grub-file --is-x86-multiboot2 myos.bin; then
  echo multiboot confirmed
else
  echo the file is not multiboot
fi
