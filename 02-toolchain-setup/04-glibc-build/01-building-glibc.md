# Building Glibc

## Introduction

Glibc (GNU C Library) provides the core C library functions and system call wrappers. It's essential for any C program. In LFS, we first install the Linux API headers, then build glibc.

## Prerequisites

- GCC Pass 1 built (Chapter 2.3)
- Kernel headers installed in `$LFS/usr/include`

## Build Steps

1. **Install Linux API headers** (if not done):

   ```bash
   cd $LFS/sources
   tar -xf linux-6.1.11.tar.xz
   cd linux-6.1.11
   make headers
   make headers_install INSTALL_HDR_PATH=$LFS/usr
   cd ..
   ```

2. **Extract glibc**:

   ```bash
   tar -xf glibc-2.37.tar.xz
   cd glibc-2.37
   ```

3. **Create build directory**:

   ```bash
   mkdir -v build
   cd build
   ```

4. **Configure**:

   ```bash
   ../configure --prefix=/usr \
                --host=$LFS_TGT \
                --build=$(../scripts/config.guess) \
                --enable-kernel=3.2 \
                --with-headers=$LFS/usr/include \
                --disable-nls \
                libc_cv_slibdir=/usr/lib
   ```

5. **Compile**:

   ```bash
   make
   ```

6. **Install**:
   ```bash
   make DESTDIR=$LFS install
   ```

## Verification

Test basic library functions:

```bash
echo 'int main(){}' | $LFS_TGT-gcc -xc - && echo "Glibc build successful"
```

## Common Issues

- **Header conflicts**: Ensure kernel headers are installed correctly.
- **Locale issues**: We disable NLS to avoid complexity.

## Security Notes

- Glibc includes security features like stack protection.
- Keep it updated for vulnerability fixes.

## Exercises

- **Exercise 1**: Install kernel headers and build glibc.
- **Exercise 2**: Test compilation of a simple program using glibc functions.

## Next Steps

With glibc complete, return to Chapter 2.3 for GCC Pass 2 (full GCC build).
