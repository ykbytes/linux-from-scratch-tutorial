# How Linux Works: Course Roadmap

A structured curriculum to help you read, navigate, and understand the Linux kernel source tree located in `../kernel/`. Each lesson builds on the previous one, moving from foundational concepts to advanced workflows used by upstream contributors.

## Learning path

| Module | Focus                        | Key outcomes                                                            |
| ------ | ---------------------------- | ----------------------------------------------------------------------- |
| 00     | Orientation & mental models  | Understand kernel vs user space, learn safe exploration habits          |
| 01     | Repository topology          | Recognize what lives in each top-level directory and why it matters     |
| 02     | Syscall tracing              | Follow a syscall end-to-end; read tables, handlers, helpers             |
| 03     | Subsystems                   | Build intuition for memory, scheduler, filesystems, networking, drivers |
| 04     | Guided labs                  | Practice grep, tracing, reading docs, and analyzing code paths          |
| 05     | Build system & configuration | Navigate Kbuild/Kconfig, compile a kernel/module, tweak configs         |
| 06     | Debugging & tracing toolkit  | Use ftrace, perf, bpftrace, dynamic debug, crash dumps                  |
| 07     | Driver lifecycle lab         | Understand how drivers probe, bind, and interact with subsystems        |
| 08     | Security frameworks          | Explore LSM hooks, SELinux/AppArmor, seccomp, lockdown                  |
| 09     | Contribution workflow        | Follow kernel coding style, review process, `get_maintainer.pl` use     |
| 10     | Appendix & glossary          | Curated references, glossary, suggested reading order                   |

## Suggested study rhythm

- **Beginner**: 60–90 minutes per module, spread over 2–3 months.
- **Intermediate**: 30–45 minutes per module; complete in 4–6 weeks.
- **Advanced**: Skim Modules 00–03, then dive into 05–09 for specialization.

## Prerequisites

- Comfort with shell, `git`, and basic C reading.
- A Linux or WSL environment for running kernel tooling (even on Windows, use WSL for build/test).
- ~20 GB free disk space if you choose to perform full builds.

## How to use this curriculum

1. **Clone**: Ensure the kernel source is available in `../kernel/` (Chapter 1 instructions).
2. **Read**: Start with `00-intro.md` and progress sequentially.
3. **Practice**: Every lesson has exercises referencing exact files and commands.
4. **Reflect**: Capture notes, questions, and TODOs in a personal notebook or a copy of the templates.
5. **Iterate**: Revisit modules as you progress through later chapters of the distro build.

## Progress tracker

Create a simple tracker (spreadsheet or markdown checklist) with columns: Module, Status, Notes, Follow-up Questions. Update it as you complete exercises.

## Supportive references

- [The Linux Kernel documentation](https://docs.kernel.org/)
- Robert Love, _Linux Kernel Development_ (book)
- Jonathan Corbet et al., _Linux Device Drivers_ (LWN edition)
- `Documentation/admin-guide/` within the repo for configuration guidance

## Next steps

Head to `00-intro.md` for mental models, or jump to a later module if you're refreshing specific knowledge. Remember to return after building your kernel in Chapter 4 to reinforce concepts with practical context.
