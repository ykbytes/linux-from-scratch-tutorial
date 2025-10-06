# AppArmor Setup

## Introduction

AppArmor provides application-level security by confining programs to defined sets of resources. Unlike SELinux which uses security contexts, AppArmor uses pathname-based mandatory access control, making it simpler to configure while still providing strong security.

## Prerequisites

- Kernel with AppArmor support
- AppArmor packages installed

## AppArmor Architecture

**Core Components:**

- **Profiles**: Define what resources an application can access
- **LSM Hooks**: Kernel enforcement points
- **Policy Compiler**: Translates profiles to kernel format
- **Modes**: Enforce (blocks violations) and Complain (logs only)

**Kernel Code References**:

- `security/apparmor/`: Main AppArmor implementation
- `security/apparmor/lsm.c`: LSM hook implementations
- `security/apparmor/policy.c`: Profile loading and management
- `security/apparmor/domain.c`: Domain transitions between profiles
- `security/apparmor/file.c`: File access control enforcement
- `security/apparmor/apparmorfs.c`: AppArmor filesystem interface
- Look for `apparmor_*()` hook functions that intercept operations

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

**Profile Enforcement in Kernel**:

When an application with an AppArmor profile tries to access a file:

1. `security/apparmor/file.c`: `apparmor_file_open()` hook is called
2. Profile lookup in `security/apparmor/policy.c`
3. Path resolution and permission check
4. Decision cached for performance
5. Access granted or denied based on profile rules

**Key Functions**:

- `aa_file_perm()`: Main file permission check
- `aa_path_perm()`: Path-based permission check
- `aa_label_sk_perm()`: Network socket permissions

## Container Integration

**Docker with AppArmor:**

```bash
# Run container with AppArmor profile
docker run --security-opt apparmor=docker-default nginx

# Run with custom profile
docker run --security-opt apparmor=custom-profile nginx

# Disable AppArmor
docker run --security-opt apparmor=unconfined nginx
```

**Kernel Code for Container Profiles**:

- Container runtimes set AppArmor profile via `aa_change_profile()` syscall
- `security/apparmor/domain.c`: `aa_change_hat()` for sub-profiles
- Profile transitions handled in `change_profile()` function
- AppArmor labels attached to task credentials in kernel

## Exercises

- **Exercise 1**: Install and enable AppArmor.
- **Exercise 2**: Create a basic profile for a test application.
- **Exercise 3**: Examine kernel AppArmor hooks with: `grep -r "apparmor_" security/apparmor/*.c`

## Next Steps

Proceed to Chapter 8.3 for firewall setup.
