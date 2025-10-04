# Buildah Installation

## Introduction

Buildah is a tool for building OCI container images without requiring a container runtime daemon.

## Prerequisites

- Podman installed (shares dependencies)
- Buildah package available

## Installation

```bash
# Install Buildah
pacman -S buildah

# Verify installation
buildah --version
```

## Basic Usage

```bash
# Create a new container
container=$(buildah from alpine)

# Mount the container
mountpoint=$(buildah mount $container)

# Modify the container
echo 'Hello World' > $mountpoint/hello.txt

# Configure the container
buildah config --entrypoint '["cat", "/hello.txt"]' $container

# Commit the image
buildah commit $container my-image

# Clean up
buildah unmount $container
buildah rm $container
```

## Dockerfile-like Building

```bash
# Create a Containerfile
cat > Containerfile << EOF
FROM alpine
RUN echo "Hello from Buildah" > /hello.txt
CMD cat /hello.txt
EOF

# Build the image
buildah bud -t my-buildah-image .
```

## Integration with Podman

```bash
# Build with Buildah, run with Podman
buildah push my-image docker-daemon:my-image
podman run my-image
```

## Exercises

- **Exercise 1**: Install Buildah and create a simple container image.
- **Exercise 2**: Build an image using a Containerfile and run it with Podman.

## Next Steps

Proceed to Chapter 9.4 for registry setup.
