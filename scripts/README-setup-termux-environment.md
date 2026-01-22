# Termux Environment Setup Script

## Overview

The `setup-termux-environment.sh` script provides a comprehensive automated installation of common packages for a general Termux user environment. This script is designed for users who want to quickly set up a fully-featured Termux environment with essential tools and utilities.

## Usage

```bash
bash scripts/setup-termux-environment.sh
```

Or make it executable and run directly:

```bash
chmod +x scripts/setup-termux-environment.sh
./scripts/setup-termux-environment.sh
```

## What Gets Installed

### Programming Languages
- Python 3, Python 2 (with dev tools)
- Ruby
- Perl
- PHP
- Go (golang)

### Development Tools
- Git
- Clang
- Nano
- OpenSSH
- OpenSSL

### Network Tools
- DNS utilities (dnsutils)
- Nmap
- cURL
- Wget
- Tor

### Shell Environments
- Fish shell
- Bash

### Compression Tools
- Tar
- Zip/Unzip
- Unrar

### System Tools
- Proot

### Display/Fun Utilities
- Figlet
- Cowsay
- Toilet
- Cmatrix
- Lolcat (Ruby gem)

### Web Browser
- w3m (text-based web browser)

### Other Utilities
- wcalc (calculator)
- bmon (bandwidth monitor)

### Python/Ruby Packages
- requests (Python package via pip2)
- lolcat (Ruby gem)

## Features

- **Automatic Updates**: Updates package lists and upgrades existing packages before installation
- **Storage Setup**: Optionally sets up storage access (prompts user)
- **Error Handling**: Gracefully handles errors without stopping the entire installation
- **Progress Messages**: Shows clear status messages for each installation step
- **Final Summary**: Displays a comprehensive summary of installed packages

## Requirements

- Termux app installed on Android
- Internet connection for downloading packages
- Sufficient storage space

## Notes

- Some packages may be skipped if they are unavailable in your Termux repository
- The script uses the `pkg` package manager (Termux's wrapper for apt)
- Installation may take several minutes depending on internet speed
- User interaction may be required for `termux-setup-storage`

## Troubleshooting

If the script fails:
1. Ensure you have a stable internet connection
2. Try running `pkg update` manually first
3. Check if you have sufficient storage space
4. Review error messages to identify which package failed
5. You can re-run the script safely - it will skip already installed packages

## Related Scripts

- `setup-termux.sh` - Sets up Termux for building packages (for developers)
- `setup-ubuntu.sh` - Sets up Ubuntu environment for cross-compilation
- `setup-archlinux.sh` - Sets up Arch Linux for package building
