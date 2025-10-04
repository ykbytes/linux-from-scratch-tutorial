# Building GCC (Pass 1)

## Introduction

GCC (GNU Compiler Collection) is the primary compiler for C and C++ in Linux systems. In LFS, GCC is built in multiple passes to ensure a clean, self-hosted toolchain. Pass 1 builds a minimal GCC that can compile the C library.

## Prerequisites

- Binutils built and installed (Chapter 2.2)
- GCC source and dependencies (mpfr, gmp, mpc) downloaded

## Build Steps

1. **Extract sources and dependencies**:

   ```bash
   cd $LFS/sources
   tar -xf gcc-12.2.0.tar.xz
   cd gcc-12.2.0

   # Extract dependencies
   tar -xf ../mpfr-4.2.0.tar.xz && mv mpfr-4.2.0 mpfr
   tar -xf ../gmp-6.2.1.tar.xz && mv gmp-6.2.1 gmp
   tar -xf ../mpc-1.2.1.tar.xz && mv mpc-1.2.1 mpc
   ```

2. **Create build directory**:

   ```bash
   mkdir -v build
   cd build
   ```

3. **Configure**:

   ```bash
   ../configure --target=$LFS_TGT \
                --prefix=$LFS/tools \
                --with-glibc-version=2.37 \
                --with-sysroot=$LFS \
                --with-newlib \
                --without-headers \
                --enable-initfini-array \
                --disable-nls \
                --disable-shared \
                --disable-multilib \
                --disable-decimal-float \
                --disable-threads \
                --disable-libatomic \
                --disable-libgomp \
                --disable-libquadmath \
                --disable-libssp \
                --disable-libvtv \
                --disable-libstdcxx \
                --enable-languages=c,c++
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

Test the compiler:

```bash
$LFS_TGT-gcc --version
```

## Notes

- This is a minimal GCC build without standard library support.
- Pass 1 GCC will be replaced by full GCC after glibc is built.

## Security Considerations

- GCC includes many security features; we'll enable more in later passes.
- Ensure no host libraries are linked.

## Exercises

- **Exercise 1**: Build GCC Pass 1 and verify with `$LFS_TGT-gcc --version`.
- **Exercise 2**: Attempt to compile a simple C program (it may fail due to missing headers).

## Next Steps

Proceed to Chapter 2.4 for Glibc headers and library build.
