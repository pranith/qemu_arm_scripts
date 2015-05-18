#!/bin/bash

qemu-system-aarch64 -M virt -m 1024M -sd armdisk.img -global virtio-blk-device.scsi=off -device virtio-scsi-device,id=scsi -drive arm_img_options -device scsi-hd,drive=coreimg -netdev user,id=unet -device virtio-net-device,netdev=unet -kernel arm_kernel_path -initrd arm_initrd_path 
-append "root=/dev/sda2"
