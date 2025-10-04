# Cloning the Linux Kernel

Follow these steps to clone the Linux kernel source code.

## Prerequisites

- Git installed (version 2.0+ recommended)
- Internet connection (preferably fast)
- Sufficient disk space (at least 1GB for shallow clone)
- Basic command line knowledge

## Step-by-Step Process

### 1. Navigate to Target Directory

```bash
# Change to the kernel acquisition directory
cd d:\education\linuxfromscratch\01-kernel-acquisition

# Verify current location
pwd

# List contents to confirm
ls -la
```

### 2. Prepare for Cloning

```bash
# Check available disk space
df -h .

# Verify git is available
git --version

# Check network connectivity to kernel.org
ping -c 3 git.kernel.org

# Optional: Configure git for better performance
git config --global core.compression 9
git config --global http.postBuffer 524288000
```

### 3. Execute the Clone Command

```bash
# Navigate to kernel subdirectory
cd kernel

# Clone with shallow depth (recommended for LFS)
git clone --depth 1 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git .

# Alternative: Clone to current directory (if kernel/ doesn't exist)
# git clone --depth 1 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git .
```

### 4. Monitor Progress

The clone process will show:

- Receiving objects
- Resolving deltas
- Updating files

Expected output:

```
Cloning into '.'...
remote: Enumerating objects: 96379, done.
remote: Counting objects: 100% (96379/96379), done.
remote: Compressing objects: 100% (93715/93715), done.
Receiving objects: 100% (96379/96379), 266.90 MiB | 6.25 MiB/s, done.
Resolving deltas: 100% (7544/7544), done.
Updating files: 100% (90960/90960), done.
```

### 5. Alternative Methods

#### Using Specific Version

```bash
# Clone specific stable version
git clone --depth 1 --branch v6.17 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git .

# Or clone from stable tree
git clone --depth 1 https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git .
```

#### Using Wget (if git fails)

```bash
# Download tarball
wget https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.17.tar.xz

# Extract
tar xf linux-6.17.tar.xz
mv linux-6.17 linux
```

#### Using Torrent (for slow connections)

```bash
# Check kernel.org for torrent links
# Use torrent client to download
# Then extract and proceed
```

## Troubleshooting

### Common Issues

#### Network Timeout

```bash
# Increase timeout
git config --global http.lowSpeedLimit 1000
git config --global http.lowSpeedTime 300

# Or use different protocol
git clone --depth 1 git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git .
```

#### Disk Space Issues

```bash
# Check space usage
du -sh .

# Clean up if needed
rm -rf .git  # Only if using tarball method

# Use external drive
export GIT_DIR=/mnt/external/kernel/.git
```

#### Permission Issues

```bash
# Fix permissions
chmod -R u+w .

# Or run as appropriate user
sudo -u builder git clone ...
```

## Performance Optimization

### For Slow Connections

```bash
# Use compression
git config --global core.compression 9
git config --global pack.windowMemory "100m"
git config --global pack.packSizeLimit "100m"
```

### For Limited Bandwidth

```bash
# Use minimal depth
git clone --depth 1 --single-branch --no-tags https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git .
```

## References

- [Git Clone Documentation](https://git-scm.com/docs/git-clone)
- [Linux Kernel Git Repository](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/)
- [Kernel Download Options](https://www.kernel.org/)
- [Shallow Cloning Guide](https://git-scm.com/docs/git-clone#Documentation/git-clone.txt---depth)
