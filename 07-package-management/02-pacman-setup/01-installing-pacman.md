# Installing Pacman

## Introduction

Pacman is Arch Linux's package manager, known for its speed and simplicity. We'll adapt it for our custom distro.

## Prerequisites

- Basic system installed
- Build tools available

## Build Steps

1. **Download pacman**:

   ```bash
   cd /sources
   wget https://sources.archlinux.org/pacman.git
   cd pacman
   ```

2. **Configure**:

   ```bash
   ./configure --prefix=/usr \
               --sysconfdir=/etc \
               --localstatedir=/var
   ```

3. **Build and install**:
   ```bash
   make
   make install
   ```

## Initial Configuration

```bash
# Create pacman config
cat > /etc/pacman.conf << EOF
[options]
RootDir = /
DBPath = /var/lib/pacman/
CacheDir = /var/cache/pacman/pkg/
LogFile = /var/log/pacman.log
GPGDir = /etc/pacman.d/gnupg/

[core]
Server = file:///repo/core

[extra]
Server = file:///repo/extra
EOF
```

## Exercises

- **Exercise 1**: Build and install pacman.
- **Exercise 2**: Configure pacman.conf for local repositories.

## Next Steps

Proceed to Chapter 7.3 for package building.
