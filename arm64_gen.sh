#!/bin/bash

# instructions from https://gist.github.com/bdsatish/7476239
if [ ! -e initrd.gz ];
then
    wget http://ftp.debian.org/debian/dists/jessie/main/installer-arm64/current/images/netboot/debian-installer/arm64/initrd.gz
fi

if [ ! -e linux ];
then
    wget http://ftp.debian.org/debian/dists/jessie/main/installer-arm64/current/images/netboot/debian-installer/arm64/linux
fi

if [ ! -e arm64disk.img ];
then
	qemu-img create -f raw arm64disk.img 16G
fi

qemu-system-aarch64 -machine virt -cdrom mini.iso -m 1024M -sd arm64disk.img -cpu cortex-a57 -kernel linux -initrd initrd.gz -append "root=/dev/ram" -no-reboot
