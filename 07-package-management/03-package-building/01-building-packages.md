# Building Packages

## Introduction

Package building creates distributable software packages using PKGBUILD scripts. This allows us to package our custom software.

## Prerequisites

- Pacman installed
- makepkg available

## PKGBUILD Structure

```bash
# Example PKGBUILD
pkgname=myapp
pkgver=1.0
pkgrel=1
arch=('x86_64')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz")
sha256sums=('...')

build() {
    cd "$pkgname-$pkgver"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
```

## Building Process

```bash
# Create package
makepkg -s  # Install dependencies and build

# Install package
pacman -U myapp-1.0-1-x86_64.pkg.tar.zst
```

## Repository Setup

```bash
# Create repository
repo-add /repo/custom.db.tar.gz *.pkg.tar.zst

# Add to pacman.conf
echo '[custom]' >> /etc/pacman.conf
echo 'Server = file:///repo' >> /etc/pacman.conf
```

## Exercises

- **Exercise 1**: Create a simple PKGBUILD and build a package.
- **Exercise 2**: Set up a local package repository.

## Next Steps

Proceed to Chapter 7.4 for repository setup.
