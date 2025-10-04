# Building Util-linux

## Introduction

Util-linux provides essential system utilities for Linux systems, including mount, umount, fdisk, and other disk and system management tools.

## Prerequisites

- Texinfo built (Chapter 3.6)
- Util-linux source in `/sources`

## Build Steps

1. **Extract**:

   ```bash
   cd /sources
   tar -xf util-linux-2.38.1.tar.xz
   cd util-linux-2.38.1
   ```

2. **Configure**:

   ```bash
   ./configure --prefix=/usr \
               --bindir=/usr/bin \
               --sbindir=/usr/sbin \
               --libdir=/usr/lib \
               --disable-chfn-chsh \
               --disable-login \
               --disable-nologin \
               --disable-su \
               --disable-setpriv \
               --disable-runuser \
               --disable-pylibmount \
               --disable-static \
               --without-python
   ```

3. **Compile**:

   ```bash
   make
   ```

4. **Install**:
   ```bash
   make install
   ```

## Verification

Test utilities:

```bash
mount --version
fdisk --version
```

## Notes

- Util-linux provides core system tools
- We disable some features to avoid conflicts

## Security Considerations

- System utilities; ensure proper permissions
- Some tools require root access

## Exercises

- **Exercise 1**: Build and install util-linux. Test `mount` and `fdisk`.
- **Exercise 2**: Use `fdisk -l` to list disk partitions (if available).

## Next Steps

With basic system complete, proceed to Chapter 4 for kernel configuration.
