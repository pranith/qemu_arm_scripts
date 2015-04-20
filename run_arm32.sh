#!/bin/bash

qemu-system-arm -smp 2 -M vexpress-a9 -m 1024M -kernel after-copy/vmlinuz-3.2.0-4-vexpress -initrd after-copy/initrd.img-3.2.0-4-vexpress -sd armdisk.img -append "root=/dev/mmcblk0p2" 
