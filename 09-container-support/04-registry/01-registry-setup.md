# Registry Setup

## Introduction

A container registry stores and distributes container images. We'll set up a local registry for development and deployment.

## Prerequisites

- Docker or Podman installed
- Registry image available

## Running a Local Registry

```bash
# Run registry container
podman run -d \
    --name registry \
    -p 5000:5000 \
    -v /var/lib/registry:/var/lib/registry \
    docker.io/library/registry:2

# Or with Docker
docker run -d \
    --name registry \
    -p 5000:5000 \
    -v /var/lib/registry:/var/lib/registry \
    registry:2
```

## Pushing Images

```bash
# Tag an image for local registry
podman tag my-image localhost:5000/my-image

# Push to registry
podman push localhost:5000/my-image

# Pull from registry
podman pull localhost:5000/my-image
```

## Registry Configuration

```bash
# Allow insecure registry (for development)
cat > /etc/containers/registries.conf << EOF
[registries.insecure]
registries = ['localhost:5000']
EOF

# For Docker
cat > /etc/docker/daemon.json << EOF
{
    "insecure-registries": ["localhost:5000"]
}
EOF
```

## Security Considerations

- Use HTTPS in production
- Implement authentication
- Regular backups of registry data

## Exercises

- **Exercise 1**: Set up a local container registry.
- **Exercise 2**: Push and pull images to/from the registry.

## Next Steps

Proceed to Chapter 10 for testing and deployment.
