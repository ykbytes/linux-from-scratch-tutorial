# Building Binutils

## Introduction

Binutils is a collection of binary utilities essential for assembling, linking, and manipulating binary files. It includes tools like `as` (assembler), `ld` (linker), `objdump`, and `readelf`. In LFS, we build binutils as part of the cross-compilation toolchain.

## Prerequisites

- LFS environment set up (from Chapter 2.1)
- Binutils source package downloaded and verified

## Build Steps

1. **Extract the source**:

   ```bash
   cd $LFS/sources
   tar -xf binutils-2.40.tar.xz
   cd binutils-2.40
   ```

2. **Create build directory**:

   ```bash
   mkdir -v build
   cd build
   ```

3. **Configure the build**:

   ```bash
   ../configure --prefix=$LFS/tools \
                --with-sysroot=$LFS \
                --target=$LFS_TGT \
                --disable-nls \
                --enable-gprofng=no \
                --disable-werror
   ```

4. **Compile**:

   ```bash
   make
   ```

5. **Install**:
   ```bash
   make install
   ```

## Verification

After installation, verify the tools are available:

```bash
ls $LFS/tools/bin | grep $LFS_TGT
```

You should see binaries like `$LFS_TGT-ld`, `$LFS_TGT-as`, etc.

## Common Issues

- **Missing dependencies**: Ensure all build dependencies are installed on the host.
- **Path issues**: Make sure `$LFS/tools/bin` is in your PATH.

## Security Notes

- Binutils handles low-level binary operations; ensure the build is clean.
- Consider enabling additional security features if available in the version.

## Exercises

- **Exercise 1**: Build and install binutils. List the installed binaries in `$LFS/tools/bin`.
- **Exercise 2**: Use `$LFS_TGT-ld --version` to verify the linker works.

## Next Steps

With binutils complete, proceed to Chapter 2.3 for GCC Pass 1.
