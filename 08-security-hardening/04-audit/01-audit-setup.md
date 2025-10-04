# Audit Setup

## Introduction

The Linux Audit system tracks security-relevant events and system calls. It provides logs for security monitoring and compliance.

## Prerequisites

- Kernel with audit support
- auditd package installed

## Installation

```bash
# Install audit
pacman -S audit

# Enable service
systemctl enable auditd
systemctl start auditd
```

## Basic Configuration

```bash
# Configure audit rules
cat > /etc/audit/rules.d/audit.rules << EOF
# Delete all existing rules
-D

# Buffer size
-b 8192

# Failure mode
-f 1

# Monitor file changes
-w /etc/passwd -p wa
-w /etc/shadow -p wa
-w /etc/sudoers -p wa

# Monitor system calls
-a always,exit -F arch=b64 -S execve -k exec
-a always,exit -F arch=b32 -S execve -k exec

# Make rules immutable
-e 2
EOF

# Load rules
augenrules --load
```

## Monitoring

```bash
# View audit logs
ausearch -k exec | head

# Real-time monitoring
auditctl -s
```

## Exercises

- **Exercise 1**: Install auditd and configure basic rules.
- **Exercise 2**: Generate audit events and view the logs.

## Next Steps

Proceed to Chapter 9 for container support.
