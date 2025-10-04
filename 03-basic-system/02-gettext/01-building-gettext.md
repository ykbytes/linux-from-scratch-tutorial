# Building Gettext

## Introduction

Gettext provides internationalization (i18n) support for software, allowing programs to display messages in different languages. In LFS, we build a minimal gettext for its utilities needed by other packages.

## Prerequisites

- Chroot environment set up (Chapter 3.1)
- Gettext source package in `/sources`

## Build Steps

1. **Extract**:

   ```bash
   cd /sources
   tar -xf gettext-0.21.tar.xz
   cd gettext-0.21
   ```

2. **Configure**:

   ```bash
   ./configure --disable-shared
   ```

3. **Compile**:

   ```bash
   make
   ```

4. **Install**:
   ```bash
   cp -v gettext-tools/src/{msgfmt,msgmerge,xgettext} /usr/bin
   ```

## Verification

Test the tools:

```bash
msgfmt --version
```

## Notes

- We only install the essential tools, not the full library
- This satisfies dependencies for other packages

## Security Notes

- Gettext handles text processing; ensure no vulnerabilities

## Exercises

- **Exercise 1**: Build and install gettext tools. Verify with `msgfmt --version`.
- **Exercise 2**: Create a simple .po file and test msgfmt on it.

## Next Steps

Proceed to Chapter 3.3 for Bison.
