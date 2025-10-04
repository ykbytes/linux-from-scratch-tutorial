# Building Texinfo

## Introduction

Texinfo is a documentation system that converts Texinfo source into various output formats like HTML, PDF, and Info pages. It's used for generating documentation for GNU software.

## Prerequisites

- Python built (Chapter 3.5)
- Texinfo source in `/sources`

## Build Steps

1. **Extract**:

   ```bash
   cd /sources
   tar -xf texinfo-7.0.tar.xz
   cd texinfo-7.0
   ```

2. **Configure**:

   ```bash
   ./configure --prefix=/usr
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

Test texinfo tools:

```bash
makeinfo --version
```

## Notes

- Texinfo is used for GNU documentation
- Provides info pages for man page alternatives

## Security Notes

- Documentation system; low security risk

## Exercises

- **Exercise 1**: Build and install texinfo. Verify with `makeinfo --version`.
- **Exercise 2**: Create a simple .texi file and convert it to info format.

## Next Steps

Proceed to Chapter 3.7 for Util-linux.
