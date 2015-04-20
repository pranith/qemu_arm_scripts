#!/bin/bash

# instructions from https://gist.github.com/bdsatish/7476239
if [ ! -e initrd.gz ];
then
	wget http://ftp.debian.org/debian/dists/wheezy/main/installer-armhf/current/images/vexpress/netboot/initrd.gz
fi

if [ ! -e vmlinuz-3.2.0-4-vexpress ];
then
	wget http://ftp.debian.org/debian/dists/wheezy/main/installer-armhf/current/images/vexpress/netboot/vmlinuz-3.2.0-4-vexpress
fi

if [ ! -e armdisk.img ];
then
	qemu-img create -f raw armdisk.img 16G
fi

qemu-system-arm -m 1024M -sd armdisk.img -M vexpress-a9 -cpu cortex-a9 -kernel vmlinuz-3.2.0-4-vexpress -initrd initrd.gz -append "root=/dev/ram" -no-reboot
