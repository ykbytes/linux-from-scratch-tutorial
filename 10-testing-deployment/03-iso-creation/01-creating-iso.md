# Creating ISO

## Introduction

Creating a bootable ISO image allows us to distribute and deploy our custom Linux distribution.

## Prerequisites

- System built and tested
- ISO creation tools available

## Using mkisofs

```bash
# Install mkisofs (cdrtools)
pacman -S cdrtools

# Create ISO structure
mkdir -p iso/{boot,EFI/BOOT}

# Copy kernel and initramfs
cp /boot/vmlinuz-* iso/boot/vmlinuz
cp /boot/initramfs-*.img iso/boot/initramfs.img

# Copy GRUB files
cp /usr/lib/grub/x86_64-efi/* iso/EFI/BOOT/

# Create GRUB config for ISO
cat > iso/EFI/BOOT/grub.cfg << EOF
set timeout=5
menuentry 'LFS Live System' {
    linux /boot/vmlinuz root=/dev/sr0 ro quiet
    initrd /boot/initramfs.img
}
EOF

# Create ISO
mkisofs -o lfs.iso \
        -b EFI/BOOT/efi.img \
        -no-emul-boot \
        -c boot.catalog \
        iso/
```

## Testing ISO

```bash
# Test in QEMU
qemu-system-x86_64 -cdrom lfs.iso -m 2048 -enable-kvm
```

## Advanced ISO Creation

```bash
# Using xorriso for better EFI support
pacman -S libisoburn

xorriso -as mkisofs \
        -o lfs.iso \
        -isohybrid-mbr /usr/lib/syslinux/isohdpfx.bin \
        -c boot.catalog \
        -b isolinux/isolinux.bin \
        -no-emul-boot \
        -boot-load-size 4 \
        -boot-info-table \
        iso/
```

## Exercises

- **Exercise 1**: Create a bootable ISO of your system.
- **Exercise 2**: Test the ISO in a virtual machine.

## Next Steps

Proceed to Chapter 10.4 for documentation.
