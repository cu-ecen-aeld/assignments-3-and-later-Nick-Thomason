# !/bin/bash
# Script to open qemu terminal.
# Author: Siddhant Jajoo.

set -e

OUTDIR=/home/nick/Github/cu_ecen_aeld/linux_build/
$1
if [ -z "${OUTDIR}" ]; then
    echo "No outdir specified. Please provide a valid outdir argument."
    exit 1
fi

mkdir -p "${OUTDIR}"
if [ $? -ne 0 ]; then
    echo "Failed to create outdir directory."
    exit 1
fi

KERNEL_IMAGE=${OUTDIR}/Image
INITRD_IMAGE=${OUTDIR}/initramfs.cpio.gz

if [ ! -e ${KERNEL_IMAGE} ]; then
    echo "Missing kernel image at ${KERNEL_IMAGE}"
    exit 1
fi
if [ ! -e ${INITRD_IMAGE} ]; then
    echo "Missing initrd image at ${INITRD_IMAGE}"
    exit 1
fi


echo "Booting the kernel"
# See trick at https://superuser.com/a/1412150 to route serial port output to file
qemu-system-aarch64 -m 1024M -M virt -cpu cortex-a53 -nographic -smp 1 -kernel ${KERNEL_IMAGE} \
        -chardev stdio,id=char0,mux=on,logfile=${OUTDIR}/serial.log,signal=off \
        -serial chardev:char0 -mon chardev=char0\
        -append "rdinit=/bin/sh" -initrd ${INITRD_IMAGE}
