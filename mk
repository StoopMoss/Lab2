#!/bin/bash
VFD=FDimage

as86 -o ts.o ts.s
bcc  -c -ansi t.c
ld86 -d -o mtx ts.o t.o mtxlib /usr/lib/bcc/libc.a

echo mount $VFD on /mnt
sudo mount -o loop $VFD /mnt

rm /mnt/boot/*

cp mtx /mnt/boot
umount /mnt

echo ready to go?
read dummy

qemu-system-x86_64 -fda FDimage -no-fd-bootchk

