# Building Python

## Introduction

Python is a modern, high-level scripting language used for system administration, automation, and application development. In LFS, python is built for package management and system tools.

## Prerequisites

- Perl built (Chapter 3.4)
- Python source in `/sources`

## Build Steps

1. **Extract**:

   ```bash
   cd /sources
   tar -xf Python-3.11.1.tar.xz
   cd Python-3.11.1
   ```

2. **Configure**:

   ```bash
   ./configure --prefix=/usr \
               --enable-shared \
               --without-ensurepip
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

Test python:

```bash
python3 --version
```

## Notes

- Python 3 is the current major version
- We disable ensurepip to avoid conflicts

## Security Considerations

- Python has extensive security features
- Keep updated for security patches

## Exercises

- **Exercise 1**: Build and install python. Test with `python3 --version`.
- **Exercise 2**: Write and run a simple python script.

## Next Steps

Proceed to Chapter 3.6 for Texinfo.
