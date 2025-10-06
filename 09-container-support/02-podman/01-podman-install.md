# Podman Installation

## Introduction

Podman is a daemonless container engine that provides a Docker-compatible interface with better security and integration with systemd. Unlike Docker, Podman runs containers as child processes and uses user namespaces for rootless operation.

## Prerequisites

- Container kernel features enabled
- Podman packages available

## Podman's Kernel Feature Usage

**Kernel Code References**:

Podman extensively uses user namespaces for rootless containers:

- **User Namespaces** (rootless operation):
  - `kernel/user_namespace.c`: UID/GID mapping for rootless
  - `kernel/uid16.c`: User ID mapping functions
  - Look for `create_user_ns()`, `map_id_range_down()`
  - Allows non-root users to run containers securely

- **No Daemon Architecture**:
  - Each container is a direct child process
  - Uses standard Linux process management
  - `kernel/fork.c`: Process creation for containers

- **CGroup Delegation** (rootless):
  - `kernel/cgroup/cgroup.c`: Unprivileged cgroup management
  - Requires `systemd.unified_cgroup_hierarchy=1`
  - Enables resource limits without root

- **Slirp4netns** (rootless networking):
  - User-mode network stack for rootless
  - Alternative to kernel bridge networking
  - Uses `net/core/net_namespace.c` for isolation

## Installation

```bash
# Install Podman
pacman -S podman

# Install buildah and skopeo for additional tools
pacman -S buildah skopeo
```

## Configuration

```bash
# Configure registries
cat > /etc/containers/registries.conf << EOF
[registries.search]
registries = ['docker.io', 'registry.fedoraproject.org']

[registries.insecure]
registries = []

[registries.block]
registries = []
EOF

# Configure storage
cat > /etc/containers/storage.conf << EOF
[storage]
driver = "overlay"
runroot = "/run/containers/storage"
graphroot = "/var/lib/containers/storage"
EOF
```

## Basic Usage

```bash
# Test installation
podman run hello-world

# Run a container
podman run -d -p 8080:80 nginx

# List containers
podman ps
```

## Rootless Operation

```bash
# Podman works rootless by default
podman run --userns=keep-id fedora echo "Hello from rootless container"
```

**Kernel Support for Rootless Containers**:

Podman's rootless mode relies heavily on user namespaces:

1. **User Namespace Setup**:
   - `kernel/user_namespace.c`: `unshare(CLONE_NEWUSER)` creates user NS
   - `/proc/self/uid_map` and `/proc/self/gid_map`: UID/GID mappings
   - Container UID 0 maps to unprivileged host UID (e.g., 100000)

2. **Subordinate UID/GID Ranges**:
   - Configured in `/etc/subuid` and `/etc/subgid`
   - Kernel validates mappings in `kernel/user_namespace.c`
   - Typically 65536 UIDs per user for containers

3. **Capability Restrictions**:
   - `kernel/capability.c`: Capability handling in user NS
   - Containers have capabilities only within their user namespace
   - Look for `ns_capable()` function for namespace-scoped capabilities

4. **Filesystem Permissions**:
   - `fs/namei.c`: Path permission checks with UID mapping
   - OverlayFS with user namespace support
   - `fs/overlayfs/super.c`: User namespace-aware mounts

**Verifying Rootless Setup**:

```bash
# Check user namespace mapping
podman unshare cat /proc/self/uid_map

# View namespace hierarchy
lsns -t user

# Check cgroup delegation
cat /sys/fs/cgroup/user.slice/user-$(id -u).slice/cgroup.controllers
```

## Exercises

- **Exercise 1**: Install Podman and run a test container.
- **Exercise 2**: Compare Podman and Docker commands.
- **Exercise 3**: Examine user namespace mappings: `podman unshare cat /proc/self/uid_map`
- **Exercise 4**: Check kernel user namespace support: `cat /proc/sys/kernel/unprivileged_userns_clone`

## Next Steps

Proceed to Chapter 9.3 for Buildah setup.
