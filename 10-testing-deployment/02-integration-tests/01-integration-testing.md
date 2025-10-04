# Integration Testing

## Introduction

Integration testing validates that system components work together correctly. This includes boot testing, service integration, and container functionality.

## Prerequisites

- System installed
- Testing tools available

## Boot Testing

```bash
# Test boot in QEMU/KVM
qemu-system-x86_64 \
    -m 2048 \
    -drive file=lfs.img,format=raw \
    -enable-kvm \
    -nographic \
    -serial mon:stdio

# Check boot logs
journalctl -b
```

## Service Integration

```bash
# Test service dependencies
systemctl list-dependencies sshd

# Test network services
curl http://localhost:80  # If web server running
ssh localhost echo "SSH works"
```

## Container Testing

```bash
# Test container runtime
podman run --rm alpine echo "Containers work"

# Test networking
podman run --rm -p 8080:80 nginx
curl http://localhost:8080
```

## Automated Testing

```bash
# Create integration test script
cat > integration_test.sh << EOF
#!/bin/bash
set -e

echo "Testing system integration..."

# Test 1: Boot completed
systemctl is-system-running

# Test 2: Network works
ping -c 1 8.8.8.8

# Test 3: Containers work
podman --version
podman run --rm alpine true

echo "All integration tests passed!"
EOF

chmod +x integration_test.sh
./integration_test.sh
```

## Exercises

- **Exercise 1**: Create and run an integration test script.
- **Exercise 2**: Test container networking and isolation.

## Next Steps

Proceed to Chapter 10.3 for ISO creation.
