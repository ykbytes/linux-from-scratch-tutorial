# Linux From Scratch - Custom Distribution Project

Purposeful, progressive guide to build a minimal, container-enabled, hardened Linux distribution from source. Each chapter is structured for learning: objectives, quick-start commands, diagrams, exercises and next steps.

## Quick links (Table of contents)

- **[01-kernel-acquisition/](01-kernel-acquisition/)** - Kernel acquisition and verification
  - [How Linux Works - Introduction](01-kernel-acquisition/how_linux_works/00-intro.md)
  - [Kernel Repo Layout](01-kernel-acquisition/how_linux_works/01-repo-layout.md)
  - [Tracing Syscalls](01-kernel-acquisition/how_linux_works/02-tracing-syscalls.md)
  - [Subsystems Deep Dive](01-kernel-acquisition/how_linux_works/03-subsystems.md)
  - [Hands-on Exercises](01-kernel-acquisition/how_linux_works/04-hands-on-exercises.md)
- **[02-toolchain-setup/](02-toolchain-setup/)** - Build a clean cross-compilation toolchain
  - [What is a Toolchain](02-toolchain-setup/01-introduction/01-what-is-a-toolchain.md)
- **[03-basic-system/](03-basic-system/)** - Build core userland utilities and libraries
  - [What is Basic System](03-basic-system/01-introduction/01-what-is-basic-system.md)
- **[04-kernel-configuration/](04-kernel-configuration/)** - Kernel tuning, hardening, container features
  - [Kernel Configuration Introduction](04-kernel-configuration/01-introduction/01-kernel-configuration-intro.md)
  - [Using Menuconfig](04-kernel-configuration/02-menuconfig/01-using-menuconfig.md)
  - [Hardening Options](04-kernel-configuration/03-hardening-options/01-hardening-options.md)
  - [Container Support](04-kernel-configuration/04-container-support/01-container-support.md)
  - [Kernel Compilation](04-kernel-configuration/05-compilation/01-kernel-compilation.md)
- **[05-bootloader/](05-bootloader/)** - GRUB, initramfs and secure boot notes
  - [Bootloader Basics](05-bootloader/01-introduction/01-bootloader-basics.md)
  - [Installing GRUB](05-bootloader/02-grub-installation/01-installing-grub.md)
  - [GRUB Configuration](05-bootloader/03-configuration/01-grub-config.md)
  - [Creating Initramfs](05-bootloader/04-initramfs/01-creating-initramfs.md)
- **[06-system-configuration/](06-system-configuration/)** - Users, networking and services
  - [Creating Users](06-system-configuration/01-users-groups/01-creating-users.md)
  - [Network Setup](06-system-configuration/02-networking/01-network-setup.md)
  - [Systemd Services](06-system-configuration/03-services/01-systemd-services.md)
  - [Logging Setup](06-system-configuration/04-logging/01-logging-setup.md)
- **[07-package-management/](07-package-management/)** - Package tooling and repository
  - [Package Management Introduction](07-package-management/01-introduction/01-package-management-intro.md)
- **[08-security-hardening/](08-security-hardening/)** - SELinux/AppArmor, firewall, audit
  - [SELinux Setup](08-security-hardening/01-selinux/01-selinux-setup.md)
  - [AppArmor Setup](08-security-hardening/02-apparmor/01-apparmor-setup.md)
  - [Firewall Setup](08-security-hardening/03-firewall/01-firewall-setup.md)
  - [Audit Setup](08-security-hardening/04-audit/01-audit-setup.md)
- **[09-container-support/](09-container-support/)** - Docker, Podman, Buildah and runtime hardening
- **[10-testing-deployment/](10-testing-deployment/)** - Tests, ISO creation and release
- **[11-container-operations/](11-container-operations/)** - Container fundamentals, pods, and inter-container communication
  - [Container Operations Fundamentals](11-container-operations/01-fundamentals/01-container-operations.md)
  - [Pod Operations](11-container-operations/02-pods/)
  - [Inter-Container Communication](11-container-operations/03-communication/)
  - [Orchestration](11-container-operations/04-orchestration/)
- **[12-container-security/](12-container-security/)** - Container attacks, vulnerabilities, and mitigation strategies
  - [Threat Modeling](12-container-security/01-threat-modeling/01-container-security.md)
- **[13-os-comparison/](13-os-comparison/)** - Comparing our custom LFS distribution with cloud-native operating systems
  - [Cloud-Native OS Comparison](13-os-comparison/01-cloud-native-comparison/01-os-comparison.md)

## Learning objectives (root)

- Understand the end-to-end workflow to create a custom Linux distribution
- Learn how to build a reproducible toolchain and core system
- Configure and harden the kernel and runtime for containers
- Package and test the distribution for deployment

## Quick start (prerequisites)

These are example commands for a typical Debian/Ubuntu host. Adapt to your distro.

```bash
# Basic tools
sudo apt-get update; sudo apt-get install -y git build-essential bison flex texinfo wget xz-utils

# Create workspace (adjust path if needed)
mkdir -p "D:/education/linuxfromscratch"  # on Windows host using WSL or similar adjust accordingly
cd d:/education/linuxfromscratch
```

## How to use this repo (recommended flow)

1. Follow Chapter 01 to acquire and verify the kernel source. 2. Build the toolchain in Chapter 02. 3. Build basic system packages in Chapter 03. 4. Configure and compile the kernel (Chapter 04). 5. Continue with bootloader, configuration, and packaging.

## Exercises (recommended)

- Exercise A: Clone the kernel as described in Chapter 1 and record the Makefile VERSION/PATCHLEVEL.
- Exercise B: On a disposable VM, run the toolchain quick-check from Chapter 2 (verify $LFS_TGT-gcc) and record results.

## References

- Linux From Scratch book: https://www.linuxfromscratch.org/lfs/
- Kernel documentation: https://www.kernel.org/doc/
- Docker docs: https://docs.docker.com/
- SELinux project: https://selinuxproject.org/

---

## Chapter Navigation & Progress

### Quick Access Table

| Chapter                        | Topic                | Status      | Time | Difficulty   |
| ------------------------------ | -------------------- | ----------- | ---- | ------------ |
| [01](01-kernel-acquisition/)   | Kernel Acquisition   | ✅ Core     | 2-3h | Beginner     |
| [02](02-toolchain-setup/)      | Toolchain Setup      | ✅ Core     | 4-6h | Intermediate |
| [03](03-basic-system/)         | Basic System         | ✅ Core     | 6-8h | Intermediate |
| [04](04-kernel-configuration/) | Kernel Configuration | ✅ Core     | 3-4h | Advanced     |
| [05](05-bootloader/)           | Bootloader Setup     | ✅ Core     | 2-3h | Intermediate |
| [06](06-system-configuration/) | System Configuration | ✅ Core     | 4-5h | Intermediate |
| [07](07-package-management/)   | Package Management   | ✅ Core     | 3-4h | Intermediate |
| [08](08-security-hardening/)   | Security Hardening   | ✅ Core     | 4-5h | Advanced     |
| [09](09-container-support/)    | Container Support    | ✅ Core     | 3-4h | Advanced     |
| [10](10-testing-deployment/)   | Testing & Deployment | ✅ Core     | 2-3h | Intermediate |
| [11](11-container-operations/) | Container Operations | ✅ Advanced | 3-4h | Advanced     |
| [12](12-container-security/)   | Container Security   | ✅ Advanced | 4-5h | Expert       |
| [13](13-os-comparison/)        | OS Comparison        | ✅ Advanced | 2-3h | Intermediate |

### Progress Overview

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📦 CORE DISTRIBUTION (Chapters 1-10) - 100% Complete
🔧 ADVANCED FEATURES (Chapters 11-13) - 100% Complete
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

██████████████████████████████████████████████████ 13/13 Chapters Complete
██████████████████████████████████████████████████ 10/10 Core Chapters Complete
██████████████████████████████████████████████████ 3/3 Advanced Chapters Complete
```

### Detailed Chapter Navigation

#### 🚀 Getting Started

| Previous | Current                 | Next                                                | Key Sections                   |
| -------- | ----------------------- | --------------------------------------------------- | ------------------------------ |
| N/A      | [**README**](README.md) | [**01-kernel-acquisition**](01-kernel-acquisition/) | Overview, Prerequisites, Setup |

#### 🧠 Core Distribution Build

**Chapter 01**: [Previous](README.md) | [**01-kernel-acquisition**](01-kernel-acquisition/) | [Next](02-toolchain-setup/)  
 Kernel source acquisition, verification, and initial setup

**Chapter 02**: [Previous](01-kernel-acquisition/) | [**02-toolchain-setup**](02-toolchain-setup/) | [Next](03-basic-system/)  
 Cross-compilation toolchain build and validation

**Chapter 03**: [Previous](02-toolchain-setup/) | [**03-basic-system**](03-basic-system/) | [Next](04-kernel-configuration/)  
 Core system utilities and libraries compilation

**Chapter 04**: [Previous](03-basic-system/) | [**04-kernel-configuration**](04-kernel-configuration/) | [Next](05-bootloader/)  
 [**Kernel Menuconfig**](04-kernel-configuration/02-menuconfig/) - Interactive configuration  
 [**Hardening Options**](04-kernel-configuration/03-hardening-options/) - Security features  
 [**Container Support**](04-kernel-configuration/04-container-support/) - Namespaces & cgroups  
 [**Kernel Compilation**](04-kernel-configuration/05-compilation/) - Build and install

**Chapter 05**: [Previous](04-kernel-configuration/) | [**05-bootloader**](05-bootloader/) | [Next](06-system-configuration/)  
 [**Bootloader Basics**](05-bootloader/01-introduction/) - Boot process fundamentals  
 [**GRUB Installation**](05-bootloader/02-grub-installation/) - GRUB setup and configuration  
 [**GRUB Configuration**](05-bootloader/03-configuration/) - Boot menu and parameters  
 [**Initramfs Creation**](05-bootloader/04-initramfs/) - Initial RAM filesystem

**Chapter 06**: [Previous](05-bootloader/) | [**06-system-configuration**](06-system-configuration/) | [Next](07-package-management/)  
 [**User Management**](06-system-configuration/01-users-groups/) - Creating users and groups  
 [**Systemd Services**](06-system-configuration/03-services/) - Service management  
 [**Networking Setup**](06-system-configuration/02-networking/) - Network configuration  
 [**Logging Setup**](06-system-configuration/04-logging/) - System logging configuration

**Chapter 07**: [Previous](06-system-configuration/) | [**07-package-management**](07-package-management/) | [Next](08-security-hardening/)  
 Package management system setup and repository configuration

#### 🔒 Security & Containers

**Chapter 08**: [Previous](07-package-management/) | [**08-security-hardening**](08-security-hardening/) | [Next](09-container-support/)  
 [**SELinux Setup**](08-security-hardening/01-selinux/) - Mandatory access control  
 [**AppArmor Setup**](08-security-hardening/02-apparmor/) - Application confinement  
 [**Firewall Setup**](08-security-hardening/03-firewall/) - Network security  
 [**Audit Setup**](08-security-hardening/04-audit/) - System auditing

**Chapter 09**: [Previous](08-security-hardening/) | [**09-container-support**](09-container-support/) | [Next](10-testing-deployment/)  
 [**Docker Setup**](09-container-support/01-docker/) - Docker runtime installation  
 [**Podman Setup**](09-container-support/02-podman/) - Podman container management  
 [**Buildah Setup**](09-container-support/03-buildah/) - Image building tools  
 [**Registry Setup**](09-container-support/04-registry/) - Container registry configuration

**Chapter 10**: [Previous](09-container-support/) | [**10-testing-deployment**](10-testing-deployment/) | [Next](11-container-operations/)  
 [**Unit Testing**](10-testing-deployment/01-unit-tests/) - Component testing  
 [**Integration Testing**](10-testing-deployment/02-integration-tests/) - System testing  
 [**ISO Creation**](10-testing-deployment/03-iso-creation/) - Distribution packaging  
 [**Documentation**](10-testing-deployment/04-documentation/) - Release documentation

#### 🚀 Advanced Topics

**Chapter 11**: [Previous](10-testing-deployment/) | [**11-container-operations**](11-container-operations/) | [Next](12-container-security/)  
 [**Container Fundamentals**](11-container-operations/01-fundamentals/) - Architecture and lifecycle  
 [**Pod Operations**](11-container-operations/02-pods/) - Multi-container management  
 [**Inter-Container Communication**](11-container-operations/03-communication/) - Networking patterns  
 [**Orchestration**](11-container-operations/04-orchestration/) - Container orchestration

**Chapter 12**: [Previous](11-container-operations/) | [**12-container-security**](12-container-security/) | [Next](13-os-comparison/)  
 [**Threat Modeling**](12-container-security/01-threat-modeling/) - Attack surface analysis  
 [**Common Attacks**](12-container-security/02-attacks/) - Vulnerability exploitation  
 [**Mitigation Strategies**](12-container-security/03-mitigation/) - Defense techniques  
 [**Security Testing**](12-container-security/04-testing/) - Security validation

**Chapter 13**: [Previous](12-container-security/) | [**13-os-comparison**](13-os-comparison/) | N/A  
 [**Cloud-Native OS Comparison**](13-os-comparison/01-cloud-native-comparison/) - Comparing with modern OSes  
 CoreOS, Flatcar, K3OS, Bottlerocket, Talos, Kairos analysis

### Navigation Shortcuts

#### 🏗️ Build Phases

- **Phase 1: Foundation** Chapters 1-2 (Prerequisites & Toolchain)
- **Phase 2: Core System** Chapters 3-5 (System Build & Boot)
- **Phase 3: Configuration** Chapters 6-7 (Services & Packages)
- **Phase 4: Security** Chapters 8-10 (Hardening & Containers)
- **Phase 5: Advanced** Chapters 11-13 (Operations, Security & Comparison)

#### 🎯 Quick Access by Topic

- **Kernel**: [01](01-kernel-acquisition/), [04](04-kernel-configuration/)
- **Security**: [08](08-security-hardening/), [12](12-container-security/)
- **Containers**: [09](09-container-support/), [11](11-container-operations/)
- **Comparison**: [13](13-os-comparison/)
- **Networking**: [06](06-system-configuration/02-networking/)
- **Boot Process**: [05](05-bootloader/)

#### 📊 Progress Tracking

- ✅ **Completed**: All 13 chapters with comprehensive content
- 🔄 **In Progress**: None - tutorial is complete
- 📋 **Next Steps**: Practice exercises, build your distribution

### Learning Path Recommendations

#### 🟢 Beginner Path (4-5 days)

1. Chapters 1-3: Basic LFS concepts
2. Chapter 4: Kernel basics
3. Chapters 5-6: Boot and system config
4. Chapter 10: Testing your build

#### 🟡 Intermediate Path (1-2 weeks)

1. Full Chapters 1-10: Complete distribution build
2. Chapter 11: Container operations
3. Focus on exercises and troubleshooting

#### 🟠 Advanced Path (2-3 weeks)

1. Complete all chapters
2. Deep dive into security (Chapters 8, 12)
3. Customize and extend the distribution
4. Contribute back to the project

---

### 📖 Reading Guide

**First Time Here?** Start with the [Quick Start](#quick-start-prerequisites) section above, then proceed to Chapter 1.

**Returning Visitor?** Use the table of contents or navigation shortcuts to jump to your current chapter.

**Looking for Specific Topics?** Check the "Quick Access by Topic" section for direct links.

**Need Help?** Each chapter includes exercises, troubleshooting guides, and references for further reading.

---

Next step: open `01-kernel-acquisition/README.md` and follow the Quick Start section there.
