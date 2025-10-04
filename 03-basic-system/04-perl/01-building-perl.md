# Building Perl

## Introduction

Perl is a powerful scripting language used extensively in build systems and system administration. In LFS, we build perl for its use in package configuration and build scripts.

## Prerequisites

- Bison built (Chapter 3.3)
- Perl source in `/sources`

## Build Steps

1. **Extract**:

   ```bash
   cd /sources
   tar -xf perl-5.36.0.tar.xz
   cd perl-5.36.0
   ```

2. **Configure**:

   ```bash
   sh Configure -des \
                -Dprefix=/usr \
                -Dvendorprefix=/usr \
                -Dprivlib=/usr/lib/perl5/5.36/core_perl \
                -Darchlib=/usr/lib/perl5/5.36/core_perl \
                -Dsitelib=/usr/lib/perl5/5.36/site_perl \
                -Dsitearch=/usr/lib/perl5/5.36/site_perl \
                -Dvendorlib=/usr/lib/perl5/5.36/vendor_perl \
                -Dvendorarch=/usr/lib/perl5/5.36/vendor_perl
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

Test perl:

```bash
perl -v
```

## Notes

- Perl is used in many configure scripts
- We build a full perl installation

## Security Notes

- Perl has a good security track record
- Keep updated for bug fixes

## Exercises

- **Exercise 1**: Build and install perl. Verify with `perl -v`.
- **Exercise 2**: Write a simple perl script and execute it.

## Next Steps

Proceed to Chapter 3.5 for Python.
