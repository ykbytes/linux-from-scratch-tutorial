# Repository Setup

## Introduction

Package repositories store and distribute software packages. We'll set up a local repository for our custom packages.

## Prerequisites

- Pacman configured
- Package building knowledge

## Repository Structure

```
/repo/
├── core/
│   ├── core.db
│   └── packages...
├── extra/
│   ├── extra.db
│   └── packages...
└── custom/
    ├── custom.db
    └── packages...
```

## Creating Repository

```bash
# Create directories
mkdir -p /repo/{core,extra,custom}

# Add packages to repository
repo-add /repo/core/core.db.tar.gz core-packages/*.pkg.tar.zst
repo-add /repo/extra/extra.db.tar.gz extra-packages/*.pkg.tar.zst
repo-add /repo/custom/custom.db.tar.gz custom-packages/*.pkg.tar.zst
```

## Client Configuration

```bash
# Update pacman.conf
cat >> /etc/pacman.conf << EOF
[core]
Server = file:///repo/core

[extra]
Server = file:///repo/extra

[custom]
Server = file:///repo/custom
EOF

# Update database
pacman -Sy
```

## Maintenance

```bash
# Update repository after adding packages
repo-add /repo/custom/custom.db.tar.gz new-package.pkg.tar.zst

# Remove old packages
paccache -rk 2  # Keep 2 versions
```

## Exercises

- **Exercise 1**: Create repository directories and add initial packages.
- **Exercise 2**: Configure pacman to use the local repositories.

## Next Steps

Proceed to Chapter 8 for security hardening.
