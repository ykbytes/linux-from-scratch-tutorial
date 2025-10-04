# How Linux Works — Introduction

This comprehensive lesson helps beginners and mid-level engineers understand the Linux kernel repository layout and how to explore and trace code from the repo. We'll build a mental model of the kernel as a complex system, then provide practical tools to navigate it safely.

## Why Understanding the Kernel Matters

The Linux kernel is the heart of the operating system — it manages hardware, processes, memory, and security. For distro builders, understanding it enables:

- Debugging boot issues or performance problems
- Customizing features (e.g., adding container support)
- Security hardening (e.g., enabling LSMs like SELinux)
- Contributing to upstream or maintaining patches

Analogy: Think of the kernel as the conductor of an orchestra. User applications are musicians, hardware is instruments, and the kernel coordinates everything to produce harmony (a working system).

## Mental Model of the Kernel

The kernel operates in two main spaces:

- **Kernel Space**: Privileged code that runs in ring 0 (x86), handles hardware, syscalls, interrupts.
- **User Space**: Unprivileged applications that request services via syscalls.

Key concepts:

- **Syscalls**: The API between user and kernel space (e.g., `open()`, `fork()`, `mmap()`).
- **Modules**: Loadable kernel extensions (drivers, filesystems) that extend functionality without rebooting.
- **Interrupts**: Hardware signals that pause execution and invoke kernel handlers.
- **Processes**: Units of execution with their own memory, files, and state.

## Navigating the Repo: Practical Strategies

The kernel repo is vast (~60,000 files, 20M+ lines). Don't try to read it all — focus on targeted exploration.

### Essential Tools

- `grep -R`: Search for symbols, functions, or strings across the tree.
- `find`: Locate files by name or type.
- `git log --grep`: Find commits related to a feature.
- `ctags` or `cscope`: Generate tags for IDE navigation (optional).

### Safe Exploration Rules

- Never modify your system's kernel files directly.
- Work in the cloned `../kernel/` directory.
- For live testing, build a kernel in a VM (see Chapter 4).
- Use `git status` to ensure no accidental changes.

## Code References and Examples

### Finding Syscall Definitions

Syscalls are defined using macros like `SYSCALL_DEFINE`. Example: `fork()` syscall.

```bash
cd ../kernel
# Find syscall definitions
grep -R "SYSCALL_DEFINE" -n kernel/ | head -n 10
# Output example: kernel/fork.c:123:SYSCALL_DEFINE0(fork)
```

Look at `kernel/fork.c` around line 123. This calls `do_fork()`, which handles the heavy lifting.

### Tracing a Simple Path: User Calls `open()`

1. Userland: `int fd = open("file.txt", O_RDONLY);`
2. Syscall entry: `arch/x86/entry/syscalls/syscall_64.tbl` maps `open` to number 2.
3. Kernel handler: `fs/open.c` contains `SYSCALL_DEFINE3(open, ...)`.
4. VFS layer: Calls `do_sys_open()` → `do_filp_open()` → filesystem-specific code.

Code reference: Open `fs/open.c` and search for `do_sys_open`. Read the comments explaining path resolution.

## Mermaid Diagram: Kernel Space vs User Space

```mermaid
graph TD
    A[User Space] -->|Syscall| B[Kernel Space]
    B --> C[Hardware Abstraction Layer]
    B --> D[Process Scheduler]
    B --> E[Memory Manager]
    B --> F[Filesystem Layer]
    B --> G[Network Stack]
    B --> H[Device Drivers]

    A --> I[Applications]
    A --> J[Libraries (glibc)]
    A --> K[Shell]

    C --> L[CPU, RAM, Disk]
    D --> M[Task Switching]
    E --> N[Page Tables, Allocators]
    F --> O[VFS, ext4, overlayfs]
    G --> P[TCP/IP, Sockets]
    H --> Q[USB, Network Cards]
```

This diagram shows the layered architecture. User space interacts via syscalls, while kernel space manages resources.

## Educational Breakdown: Syscalls for Beginners

Syscalls are like function calls, but they switch from user to kernel mode (expensive, so minimize them).

- **Types**: File I/O (`read`, `write`), process (`fork`, `exec`), memory (`mmap`), network (`socket`).
- **How it works**: User library (e.g., glibc) invokes `syscall()` with a number. Kernel looks up the handler in the syscall table.
- **Why learn**: Understanding syscalls helps debug slow apps or security issues (e.g., seccomp filters syscalls).

Example code reference: In `arch/x86/entry/syscalls/syscall_64.tbl`, find `__NR_open` and trace to `fs/open.c`.

## Exercises

1. **Basic Search**: Use `grep -R "task_struct" -n include/linux/ | head -n 5` to find the process structure definition. Read the comments in `include/linux/sched.h`.

2. **Syscall Count**: Run `grep -R "SYSCALL_DEFINE" -n | wc -l` to count syscall implementations. Compare to `man 2 syscall` for userland names.

3. **Mental Mapping**: Draw (on paper) how `fork()` creates a new process. Reference `kernel/fork.c` for the `copy_process()` call.

## Next Steps

- Read `01-repo-layout.md` for a directory-by-directory guide.
- Practice with `grep` to find 3 more syscalls and their handlers.
- For advanced: Set up ctags with `ctags -R .` in the kernel dir for IDE support.

This foundation will make the rest of the kernel exploration intuitive and rewarding.
