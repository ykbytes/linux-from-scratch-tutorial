# Podman Installation

## Introduction

Podman is a daemonless container engine that provides a Docker-compatible interface with better security and integration with systemd.

## Prerequisites

- Container kernel features enabled
- Podman packages available

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

## Exercises

- **Exercise 1**: Install Podman and run a test container.
- **Exercise 2**: Compare Podman and Docker commands.

## Next Steps

Proceed to Chapter 9.3 for Buildah setup.
