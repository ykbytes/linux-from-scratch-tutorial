# Kernel Configuration Introduction

## Overview

Kernel configuration is the process of selecting which features, drivers, and options to include in the Linux kernel. For our container-ready distro, we need to enable essential features plus container support and hardening options.

## Key Areas

- **Core Kernel**: Basic system support
- **Container Features**: Namespaces, cgroups, overlayfs
- **Security**: Hardening options, LSM support
- **Filesystems**: Essential and container filesystems
- **Networking**: Basic and container networking

## Tools

- `make menuconfig`: Interactive configuration
- `make oldconfig`: Update existing config
- `.config` file: Configuration storage

## Kernel Configuration System

**Kconfig System - Kernel Code References**:

The kernel configuration is managed by the Kconfig system:

- `scripts/kconfig/`: Kconfig parser and menuconfig implementation
  - `scripts/kconfig/conf.c`: Configuration tool implementation
  - `scripts/kconfig/mconf.c`: Menuconfig ncurses interface
  - `scripts/kconfig/expr.c`: Dependency resolution

- **Kconfig Files**:
  - Top-level `Kconfig` in kernel root
  - `arch/*/Kconfig`: Architecture-specific options
  - Subsystem `Kconfig` files in each directory (e.g., `fs/Kconfig`, `net/Kconfig`)

- **Config File Processing**:
  - `scripts/kconfig/confdata.c`: `.config` file reading/writing
  - `include/linux/kconfig.h`: Kernel config macros
  - Look for `IS_ENABLED()`, `IS_BUILTIN()`, `IS_MODULE()` macros

**Configuration Symbol Format**:
```
CONFIG_FEATURE_NAME=y    # Built into kernel
CONFIG_FEATURE_NAME=m    # Built as module
CONFIG_FEATURE_NAME=n    # Not enabled
```

## Learning Objectives

- Understand kernel configuration options
- Enable container and security features
- Optimize for our use case

## Quick Start

```bash
cd /sources/linux
make mrproper  # Clean any existing config
make defconfig  # Start with defaults
make menuconfig  # Interactive config
```

## Configuration Flow

```mermaid
graph TD
    A[Kernel Source] --> B[Base Config]
    B --> C[Container Features]
    C --> D[Security Options]
    D --> E[Filesystem Support]
    E --> F[Build Kernel]
```

## Security Considerations

- Enable security modules (SELinux/AppArmor)
- Disable unnecessary features
- Enable kernel hardening options

## Exercises

- **Exercise 1**: Start with `make defconfig` and examine the `.config` file.
- **Exercise 2**: Use `make menuconfig` to navigate the configuration menus.
- **Exercise 3**: Explore Kconfig files: `find . -name Kconfig | head -10` to see how options are defined.
- **Exercise 4**: Check configuration dependencies: `grep -A5 "config NAMESPACES" init/Kconfig`

## Next Steps

Proceed to Chapter 4.2 for detailed menuconfig usage.
