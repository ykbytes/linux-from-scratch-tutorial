# Kernel Repo Layout Deep Dive

This detailed lesson explores the major top-level directories in the Linux kernel repository, providing educational context, code references, and practical navigation tips. We'll cover what each directory does, why it matters, and how to start reading the code.

## Educational Context: Why Directory Structure Matters

The kernel's directory structure reflects its modular design. Core subsystems are separated for maintainability, allowing developers to focus on one area (e.g., networking) without affecting others. This separation also aids in understanding: if you're debugging a filesystem issue, you know to look in s/.

Analogy: The kernel repo is like a city's infrastructure rch/ is the local government (architecture-specific), kernel/ is city hall (core services), drivers/ are utility companies (hardware interfaces), and s/ is the zoning department (file organization).

## Top-Level Directories: Detailed Breakdown

### rch/ Architecture-Specific Code

**Purpose**: Contains code that varies by CPU architecture (x86, ARM, etc.). This includes boot code, syscall entry points, and hardware-specific optimizations.

**Why it matters**: The kernel must adapt to different processors. For x86 systems, this is where interrupts, paging, and early boot happen.

**Key subdirs**:

- rch/x86/ x86-specific (boot, entry, kernel).
- rch/x86/entry/ Syscall and interrupt entry stubs.
- rch/x86/boot/ Early boot code (compressed kernel, setup).

**Code references**:

- rch/x86/entry/syscalls/syscall_64.tbl Syscall number mappings (e.g., \_\_NR_fork 57).
- rch/x86/kernel/cpu/ CPU feature detection and initialization.

**Educational tip**: Start here if you're interested in low-level boot. Read rch/x86/boot/header.S for the 'magic' boot signature.

### kernel/ Core Kernel Code

**Purpose**: The heart of the kernel process management, scheduling, signals, and core utilities.

**Why it matters**: This handles the fundamental operations like creating processes or handling signals. It's where the 'kernel logic' lives.

**Key files**:

- kernel/fork.c Process creation (do_fork, copy_process).
- kernel/sched/ Scheduler code (fair.c for CFS, core.c for common).
- kernel/signal.c Signal handling.
- kernel/exec.c Executing new programs.

**Code references**:

- In kernel/fork.c, look at do_fork() (around line 2000+). It calls copy_process() to duplicate the task struct.
- kernel/sched/core.c contains schedule() the function that switches tasks.

**Educational tip**: Processes are the kernel's way of multitasking. Read the comments in kernel/fork.c for the fork/clone differences.

### init/ Kernel Initialization

**Purpose**: Code that runs before userland starts. This sets up the kernel environment.

**Why it matters**: This is where the kernel transitions from boot to running. It's critical for understanding boot sequences.

**Key files**:

- init/main.c start_kernel() function, the entry point after boot.
- init/version.c Version strings.

**Code references**:

- init/main.c line ~1000: start_kernel() calls subsystems like setup_arch(), mm_init(), sched_init().

**Educational tip**: Think of this as the kernel's 'main()' function. It initializes everything in order.

### mm/ Memory Management

**Purpose**: Handles virtual memory, page allocation, swapping, and memory mapping.

**Why it matters**: Memory is scarce; the kernel must manage it efficiently to prevent crashes or slowdowns.

**Key files**:

- mm/page_alloc.c Buddy allocator for pages.
- mm/mmap.c Memory mapping (mmap syscall).
- mm/slab.c Object caching.

**Code references**:

- mm/page_alloc.c: lloc_pages() function allocates physical pages.
- mm/mmap.c: do_mmap() handles user memory mappings.

**Educational tip**: Virtual memory allows processes to think they have all RAM. Read about the page table in mm/pgtable-generic.h.

### s/ Filesystems

**Purpose**: Implements filesystems (ext4, overlayfs) and the Virtual Filesystem (VFS) layer.

**Why it matters**: Filesystems abstract storage; VFS provides a common interface.

**Key subdirs**:

- s/ VFS core (open.c,
  ead_write.c,
  amei.c for path lookup).
- s/ext4/ ext4 filesystem code.
- s/overlayfs/ Union filesystem for containers.

**Code references**:

- s/open.c: do_sys_open() for the open syscall.
- s/namei.c: path_lookup() resolves paths to inodes.

**Educational tip**: VFS is like a translator; it lets different filesystems speak the same language.

### drivers/ Device Drivers

**Purpose**: Interfaces to hardware devices (network cards, USB, etc.).

**Why it matters**: Without drivers, hardware is useless. This is the largest directory.

**Key subdirs**:

- drivers/net/ Network drivers.
- drivers/block/ Disk drivers.
- drivers/char/ Character devices (e.g., /dev/null).

**Code references**:

- drivers/net/ethernet/intel/e1000/ Intel NIC driver (probe, transmit functions).

**Educational tip**: Drivers register with the kernel via
egister_netdev(). Start with simple char drivers.

### include/ Header Files

**Purpose**: Definitions, structs, and macros used across the kernel.

**Why it matters**: Headers define interfaces; they're essential for understanding data structures.

**Key subdirs**:

- include/linux/ Core headers (sched.h for task_struct, mm.h for mm_struct).
- include/asm/ Architecture-specific headers.

**Code references**:

- include/linux/sched.h: struct task_struct the process descriptor.
- include/linux/mm.h: struct mm_struct memory management struct.

**Educational tip**: Always check headers first for struct definitions and comments.

###

et/ Networking Stack
**Purpose**: TCP/IP, sockets, routing, and network protocols.

**Why it matters**: Networking enables communication; it's complex due to layers (link, IP, transport).

**Key subdirs**:

- et/core/ Core networking (dev.c for device registration).
- et/ipv4/ IPv4 stack.
- et/packet/ Raw sockets.

**Code references**:

- et/core/dev.c:
  egister_netdev() registers network devices.
- et/ipv4/tcp.c: TCP state machine.

**Educational tip**: Networking follows the OSI model. Read
et/ipv4/tcp.c for connection states.

### lib/ Kernel Libraries

**Purpose**: Utility functions (string ops, CRCs, lists) used by the kernel.

**Why it matters**: Reusable code to avoid duplication.

**Key files**:

- lib/string.c String functions.
- lib/list.h Linked list macros.

**Code references**:

- lib/list.h: LIST_HEAD_INIT for initializing lists.

**Educational tip**: These are like standard libraries but kernel-safe.

### scripts/ Build and Utility Scripts

**Purpose**: Tools for building the kernel, generating code, and maintenance.

**Why it matters**: Automates complex tasks like dependency generation.

**Key files**:

- scripts/Makefile.build Build logic.
- scripts/kconfig/ Menuconfig tools.

**Educational tip**: Run make help to see available targets.

### Documentation/ Kernel Docs

**Purpose**: Guides, API docs, and design explanations.

**Why it matters**: Often the best starting point for understanding features.

**Key files**:

- Documentation/filesystems/overlayfs.rst OverlayFS guide.
- Documentation/networking/ Networking docs.

**Educational tip**: Use this before diving into code.

## Mermaid Diagram: Directory Relationships

`mermaid
graph TD
A[arch/] --> B[kernel/]
A --> C[mm/]
B --> D[fs/]
B --> E[net/]
C --> F[drivers/]
D --> G[include/]
E --> H[lib/]
F --> I[scripts/]
G --> J[Documentation/]

    B --> K[init/]
    K --> L[Boot Sequence]

    style A fill:#f9f
    style B fill:#bbf
    style C fill:#bfb
    style D fill:#ffb
    style E fill:#fbb

`

This graph shows dependencies: rch/ initializes hardware, kernel/ provides core services, and others build on top.

## Practical File References (Start Here)

- Process management: kernel/fork.c (line ~1500: do_fork), kernel/sched/core.c (schedule).
- Syscall entry/dispatch: rch/x86/entry/syscalls/syscall_64.tbl, kernel/sys.c.
- Virtual filesystem: s/open.c (do_sys_open), s/read_write.c (fs_read).
- Network stack:
  et/core/dev.c (
  etif_rx),
  et/ipv4/af_inet.c.
- Block layer: lock/blk-core.c (submit_bio).

## Exercises

1. **Explore a Directory**: Pick mm/ and run ind mm/ -name '\*.c' | head -n 5. Open one file and read the top comments.

2. **Cross-Reference**: Find where ask_struct is used in kernel/fork.c. Use grep -n 'task_struct' kernel/fork.c.

3. **Header Hunt**: In include/linux/sched.h, find the state field in ask_struct and explain what the values mean (reference kernel/sched/core.c).

This deep dive equips you to navigate the repo confidently. Next, trace specific syscalls in  2-tracing-syscalls.md.
