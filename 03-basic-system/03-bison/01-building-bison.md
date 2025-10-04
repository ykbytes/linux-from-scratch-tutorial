# Building Bison

## Introduction

Bison is a parser generator that converts grammar descriptions into C code. It's used to build compilers and interpreters. In LFS, bison is needed for building other development tools.

## Prerequisites

- Gettext built (Chapter 3.2)
- Bison source in `/sources`

## Build Steps

1. **Extract**:

   ```bash
   cd /sources
   tar -xf bison-3.8.2.tar.xz
   cd bison-3.8.2
   ```

2. **Configure**:

   ```bash
   ./configure --prefix=/usr \
               --docdir=/usr/share/doc/bison-3.8.2
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

Test bison:

```bash
bison --version
```

## Notes

- Bison generates LALR parsers
- Required for many build systems

## Security Considerations

- Parser generators can be complex; keep updated

## Exercises

- **Exercise 1**: Build and install bison. Test with `bison --version`.
- **Exercise 2**: Create a simple yacc grammar file and generate parser code.

## Next Steps

Proceed to Chapter 3.4 for Perl.
