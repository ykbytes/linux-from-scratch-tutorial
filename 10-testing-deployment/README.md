# Chapter 10: Testing and Deployment

Final testing, ISO creation, and deployment preparation.

## Learning objectives

- Design and run unit/integration/security tests for your system
- Build an installable ISO and perform a smoke install in a VM
- Prepare release notes and artifacts

## Testing Phases

- Unit testing of components
- Integration testing
- Security testing
- Performance benchmarking

## Quick start (ISO creation - concept)

```bash
# using xorriso + isolinux/grub (conceptual; specifics depend on your layout)
mkdir -p iso/{boot,EFI}
cp /boot/vmlinuz-* iso/boot/
cp /boot/initramfs-* iso/boot/
# generate EFI/BIOS boot structures here...
xorriso -as mkisofs -o lfs.iso -isolevel 3 -J -R iso
```

Note for Windows hosts

- Run ISO creation commands inside WSL or a Linux VM. Tools like xorriso, grub-mkrescue, and dracut are Linux-native.

How to use the provided helper script (Linux/WSL)

- The repo includes `scripts/iso/build-iso.sh` to scaffold a basic ISO. Adjust kernel/initramfs paths as needed.
- Example run:

```bash
cd scripts/iso
sudo ./build-iso.sh /tmp/lfs-iso /mnt/lfs
```

### Testing pipeline

```mermaid
flowchart LR
	A[Build artifacts\n(kernel, initramfs, rootfs)] --> B[Create ISO]
	B --> C[Boot in VM]
	C --> D[Smoke tests]
	D --> E[Security scans]
	E --> F[Performance checks]
	F --> G[Sign & Release]
```

## Deployment

- ISO image creation
- Installation scripts
- Documentation
- Release preparation

### Release checklist (example)

- [ ] ISO boots on UEFI and Legacy BIOS in at least two hypervisors
- [ ] Kernel version and config documented
- [ ] Container runtime passes rootless run test
- [ ] SELinux/AppArmor policy defaults enforced
- [ ] Firewall baseline active and persists on reboot
- [ ] Packages signed and repository metadata updated
- [ ] Release notes drafted and reviewed

Templates

- Use `RELEASE_NOTES_TEMPLATE.md` at the repo root to draft your notes.

## Test matrix (example)

| Area       | Test                         | Tool                 | Status |
| ---------- | ---------------------------- | -------------------- | ------ |
| Kernel     | Boot with modules            | dmesg/journalctl     | ⏳     |
| Security   | SELinux/AppArmor enforcement | auditd/aa-logprof    | ⏳     |
| Containers | Run rootless Podman          | podman info/run      | ⏳     |
| Network    | DHCP/static and DNS          | ping/curl/resolvectl | ⏳     |
| Package    | Install from repo            | pacman               | ⏳     |

## Quality Assurance

- Automated testing suites
- Security audits
- Performance validation
- User acceptance testing

## Exercises

- Exercise 1: Boot the ISO in a VM and validate the test matrix.
- Exercise 2: Write a short release note summarizing features, versions and known issues.

## Next steps

- Start a new iteration: collect feedback and plan the next hardening and performance improvements.
