#!/bin/bash
# Comprehensive Termux Environment Setup Script
# This script installs common packages for a general Termux user environment

set -e -u

echo "Starting comprehensive Termux environment setup..."

# Setup storage access
echo "Setting up storage access..."
termux-setup-storage || true

# Change to home directory
cd "$HOME" || cd

# Configure any unpacked but not yet configured packages
echo "Configuring unpacked packages..."
dpkg --configure -a || true

# Update package lists
echo "Updating package lists..."
pkg update -y

# Upgrade existing packages
echo "Upgrading existing packages..."
pkg upgrade -y

# Programming Languages
echo "Installing programming languages..."
pkg install -y python python2 python2-dev python3 ruby perl php golang

# Python package managers
echo "Installing Python package managers..."
pkg install -y pip pip2

# Install Python packages
echo "Installing Python requests module..."
pip2 install requests || true

# Ruby gems
echo "Installing Ruby lolcat gem..."
gem install lolcat || true

# Development Tools
echo "Installing development tools..."
pkg install -y git clang nano openssh openssl

# Network Tools
echo "Installing network tools..."
pkg install -y dnsutils nmap curl wget tor

# Shell and Terminal
echo "Installing shell and terminal utilities..."
pkg install -y fish bash

# Compression Tools
echo "Installing compression tools..."
pkg install -y tar zip unzip unrar

# System Tools
echo "Installing system tools..."
pkg install -y proot

# Text Display Tools
echo "Installing text display tools..."
pkg install -y figlet cowsay toilet

# Web Browser
echo "Installing web browser..."
pkg install -y w3m

# Utilities
echo "Installing utilities..."
pkg install -y wcalc bmon cmatrix

# Note: The following packages were in the original command but may not be available
# or may be deprecated. They are commented out to avoid errors:
# - wgetrc (this is a configuration file, not a package)
# - chroot (may not be available as standalone package)

# Final system update
echo "Performing final system update..."
apt update && apt upgrade -y

echo ""
echo "=========================================="
echo "Termux environment setup completed!"
echo "=========================================="
echo ""
echo "Installed packages:"
echo "  - Programming: Python (2 & 3), Ruby, Perl, PHP, Go"
echo "  - Development: Git, Clang, Nano, OpenSSH, OpenSSL"
echo "  - Network: DNS utils, Nmap, cURL, Wget, Tor"
echo "  - Shell: Fish, Bash"
echo "  - Compression: Tar, Zip, Unzip, Unrar"
echo "  - System: Proot"
echo "  - Display: Figlet, Cowsay, Toilet, Cmatrix"
echo "  - Browser: w3m"
echo "  - Utilities: wcalc, bmon"
echo ""
echo "Note: Some packages may have been skipped if they were"
echo "      unavailable or encountered errors during installation."
echo ""
