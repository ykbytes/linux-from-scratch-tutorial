# AppArmor Setup

## Introduction

AppArmor provides application-level security by confining programs to defined sets of resources.

## Prerequisites

- Kernel with AppArmor support
- AppArmor packages installed

## Installation

```bash
# Install AppArmor
pacman -S apparmor apparmor-profiles

# Enable service
systemctl enable apparmor
systemctl start apparmor
```

## Profile Management

```bash
# List profiles
apparmor_status

# Create custom profile
aa-genprof /path/to/application

# Edit profile
apparmor_parser -r /etc/apparmor.d/profile
```

## Basic Profile Example

```bash
# /etc/apparmor.d/usr.bin.testapp
/usr/bin/testapp {
    #include <abstractions/base>

    /usr/bin/testapp mr,
    /etc/testapp/config r,
    /var/log/testapp.log w,
}
```

## Exercises

- **Exercise 1**: Install and enable AppArmor.
- **Exercise 2**: Create a basic profile for a test application.

## Next Steps

Proceed to Chapter 8.3 for firewall setup.
