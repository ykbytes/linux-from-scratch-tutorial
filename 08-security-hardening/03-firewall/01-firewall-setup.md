# Firewall Setup

## Introduction

A firewall controls network traffic to protect the system from unauthorized access. We'll use nftables for modern, efficient firewall rules.

## Prerequisites

- Kernel with netfilter support
- nftables installed

## Basic Configuration

```bash
# Create basic ruleset
cat > /etc/nftables.conf << EOF
#!/usr/sbin/nft -f

flush ruleset

table inet filter {
    chain input {
        type filter hook input priority 0; policy drop;

        # Allow loopback
        iif lo accept

        # Allow established connections
        ct state established,related accept

        # Allow SSH
        tcp dport 22 accept

        # Allow ICMP
        ip protocol icmp accept
    }

    chain forward {
        type filter hook forward priority 0; policy drop;
    }

    chain output {
        type filter hook output priority 0; policy accept;
    }
}
EOF

# Load rules
nft -f /etc/nftables.conf

# Enable service
systemctl enable nftables
```

## Container Considerations

```bash
# Allow Docker/Podman traffic
nft add rule inet filter input tcp dport 2376 accept  # Docker
nft add rule inet filter input tcp dport 22 accept    # SSH for management
```

## Exercises

- **Exercise 1**: Set up basic nftables firewall rules.
- **Exercise 2**: Test connectivity and verify rules are working.

## Next Steps

Proceed to Chapter 8.4 for audit setup.
