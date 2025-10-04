#!/usr/bin/env bash
set -euo pipefail

# Minimal ISO builder (concept). Run inside Linux/WSL with required tools installed.
# Requirements: xorriso, grub-mkrescue or isolinux (depending on boot method), mtools, squashfs-tools (optional), dracut (optional)
# Usage: sudo ./build-iso.sh /path/to/staging rootfs_dir

if [[ ${EUID:-$(id -u)} -ne 0 ]]; then
  echo "Please run as root (needed for device nodes and some tooling)." >&2
  exit 1
fi

STAGING_DIR=${1:-/tmp/lfs-iso}
ROOTFS_DIR=${2:-/mnt/lfs}
OUT_ISO=${OUT_ISO:-lfs-$(date +%Y%m%d).iso}
LABEL=${LABEL:-LFS}

mkdir -p "$STAGING_DIR"/iso/{boot,EFI}

# Copy kernel and initramfs (edit paths for your system)
cp /boot/vmlinuz-* "$STAGING_DIR"/iso/boot/
if compgen -G "/boot/initramfs-*" > /dev/null; then
  cp /boot/initramfs-* "$STAGING_DIR"/iso/boot/
fi

# Optionally pack a rootfs (squashfs recommended)
if command -v mksquashfs >/dev/null 2>&1 && [[ -d "$ROOTFS_DIR" ]]; then
  mksquashfs "$ROOTFS_DIR" "$STAGING_DIR"/iso/rootfs.squashfs -comp xz -noappend
fi

# Insert minimal GRUB config (UEFI+BIOS approach may require grub-mkrescue)
GRUB_DIR="$STAGING_DIR/iso/boot/grub"
mkdir -p "$GRUB_DIR"
cat > "$GRUB_DIR/grub.cfg" <<'EOF'
set default=0
set timeout=5
menuentry "LFS (autoboot)" {
  linux /boot/vmlinuz-* root=/dev/ram0 ro quiet
  initrd /boot/initramfs-*
}
EOF

# Create ISO (BIOS/UEFI specifics omitted; adjust for grub-mkrescue if available)
if command -v grub-mkrescue >/dev/null 2>&1; then
  grub-mkrescue -o "$OUT_ISO" "$STAGING_DIR/iso" 2>/dev/null || true
fi

if ! [[ -f "$OUT_ISO" ]]; then
  xorriso -as mkisofs -o "$OUT_ISO" -isolevel 3 -J -R "$STAGING_DIR/iso"
fi

echo "ISO created: $OUT_ISO"