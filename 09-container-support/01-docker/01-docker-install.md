# Docker Installation

## Introduction

Docker provides containerization technology for packaging and running applications in isolated environments.

## Prerequisites

- Kernel with container support
- Docker packages available

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

## Exercises

- **Exercise 1**: Install Docker and run a test container.
- **Exercise 2**: Configure rootless Docker and test functionality.

## Next Steps

Proceed to Chapter 9.2 for Podman setup.
