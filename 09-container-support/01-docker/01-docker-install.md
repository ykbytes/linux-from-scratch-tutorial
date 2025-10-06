# Docker Installation

## Introduction

Docker provides containerization technology for packaging and running applications in isolated environments. It relies on several Linux kernel features including namespaces, cgroups, and security modules.

## Prerequisites

- Kernel with container support
- Docker packages available

## Kernel Features Used by Docker

**Kernel Code References**:

Docker leverages these kernel subsystems:

- **Namespaces** (isolation):
  - `kernel/pid_namespace.c`: PID isolation
  - `net/core/net_namespace.c`: Network isolation
  - `fs/namespace.c`: Mount point isolation
  - `kernel/user_namespace.c`: User/UID mapping

- **CGroups** (resource limits):
  - `kernel/cgroup/cgroup.c`: Resource control
  - `mm/memcontrol.c`: Memory limits
  - `kernel/sched/core.c`: CPU limits

- **OverlayFS** (image layers):
  - `fs/overlayfs/`: Container image layering

- **Netfilter/iptables** (networking):
  - `net/netfilter/`: Container network isolation
  - `net/bridge/`: Bridge networking

- **Seccomp** (syscall filtering):
  - `kernel/seccomp.c`: Syscall restrictions

## Installation

```bash
# Install Docker
pacman -S docker

# Enable and start service
systemctl enable docker
systemctl start docker
```

## Rootless Setup

```bash
# Install rootless tools
pacman -S docker-rootless-extras

# Configure rootless
dockerd-rootless-setuptool.sh install

# Add to user session
echo 'export DOCKER_HOST=unix:///run/user/1000/docker.sock' >> ~/.bashrc
```

## Basic Usage

```bash
# Test installation
docker run hello-world

# Run a container
docker run -d -p 8080:80 nginx
```

## Security Configuration

```bash
# Configure daemon
cat > /etc/docker/daemon.json << EOF
{
    "icc": false,
    "userns-remap": "default",
    "log-driver": "json-file",
    "log-opts": {
        "max-size": "10m",
        "max-file": "3"
    }
}
EOF

# Restart docker
systemctl restart docker
```

**Kernel Security Features in Docker**:

- **userns-remap**: Uses user namespaces for security
  - `kernel/user_namespace.c`: `create_user_ns()` for UID/GID mapping
  - Maps container root (UID 0) to unprivileged host UID

- **icc: false**: Inter-container communication control
  - `net/bridge/br_forward.c`: Bridge forwarding rules
  - Uses iptables/netfilter for isolation

- **seccomp**: Default seccomp profile blocks ~44 syscalls
  - `kernel/seccomp.c`: Syscall filtering
  - Profile defined in Docker source, enforced by kernel

- **AppArmor/SELinux**: MAC (Mandatory Access Control)
  - `security/apparmor/`: AppArmor enforcement
  - `security/selinux/`: SELinux enforcement
  - Docker sets security contexts before container exec

## Exercises

- **Exercise 1**: Install Docker and run a test container.
- **Exercise 2**: Configure rootless Docker and test functionality.
- **Exercise 3**: Examine kernel namespaces used by container: `lsns -p $(docker inspect -f '{{.State.Pid}}' container_name)`

## Next Steps

Proceed to Chapter 9.2 for Podman setup.
