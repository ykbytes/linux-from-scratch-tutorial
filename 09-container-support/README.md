# Chapter 9: Container Support

Adding container runtime support for modern application deployment.

## Learning objectives

- Install and validate container runtimes (Docker/Podman) on the custom system
- Ensure kernel features and cgroups are properly configured
- Integrate security profiles with containers

## Container Runtimes

- Docker Engine
- Podman (daemonless containers)
- Buildah (container building)
- Container registry setup

## Quick start (Podman example)

```bash
sudo apt-get install -y podman || true
podman info
podman run --rm quay.io/podman/hello
```

## Integration

- Kernel namespace support
- CGroup management
- Overlay filesystem
- Security integration with containers

### Security integration details

- Seccomp: provide a restrictive default; only allow required syscalls for workloads.
- LSM: ensure containers launch with an AppArmor/SELinux profile by default.
- Rootless: prefer rootless containers to reduce attack surface; validate user namespaces are active.
- Capabilities: drop all and add back only what’s needed (`--cap-drop=ALL --cap-add=NET_BIND_SERVICE`, etc.).

Example seccomp profile snippet (`seccomp-min.json`):

```json
{
  "defaultAction": "SCMP_ACT_ERRNO",
  "archMap": [
    {
      "architecture": "SCMP_ARCH_X86_64",
      "subArchitectures": ["SCMP_ARCH_X86", "SCMP_ARCH_X32"]
    }
  ],
  "syscalls": [
    {
      "names": [
        "read",
        "write",
        "exit",
        "sigreturn",
        "fstat",
        "brk",
        "mmap",
        "mprotect",
        "munmap",
        "close",
        "rt_sigaction",
        "rt_sigprocmask",
        "clone",
        "set_tid_address",
        "set_robust_list",
        "prlimit64",
        "arch_prctl",
        "getrandom"
      ],
      "action": "SCMP_ACT_ALLOW"
    }
  ]
}
```

Run with seccomp and AppArmor:

```bash
podman run --rm \
	--security-opt seccomp=/path/to/seccomp-min.json \
	--security-opt apparmor=podman-default \
	--cap-drop=ALL --cap-add=NET_BIND_SERVICE \
	-p 8080:8080 quay.io/podman/hello
```

Rootless setup checks:

```bash
id -u
podman info --format '{{.Host.Security.UserNS.Isolation}}'
podman run --rm --userns=keep-id alpine id
```

## Runtime diagram

```mermaid
graph TD
	K[Kernel namespaces + cgroups] --> R[Container runtime]
	R --> S[Storage (overlayfs)]
	R --> N[Networking]
	R --> P[Policy (AppArmor/SELinux/seccomp)]
```

## Exercises

- Exercise 1: Run a rootless container and verify it uses user namespaces.
- Exercise 2: Apply a seccomp profile to a Podman container and observe syscall denials.
- Exercise 3: Constrain a container with `--pids-limit`, `--memory`, and `--cpus` and confirm enforcement.
- Exercise 4: Run with `--cap-drop=ALL` and add back only one capability required by your app; verify failure then success.

## Next steps

- Move to Chapter 10 to test the system end-to-end and prepare an installable ISO.
