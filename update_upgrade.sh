#!/bin/bash

# Update and upgrade script
# This script updates package lists and upgrades all installed packages.

echo "Starting system update and upgrade process..."

# Update package lists
echo "Updating package lists..."
sudo apt update -y
sudo apt-get update -y
# Upgrade installed packages
echo "Upgrading installed packages..."
sudo apt upgrade -y
sudo apt-get upgrade -y
# Full upgrade (handles changing dependencies)
echo "Performing full upgrade..."
sudo apt full-upgrade -y
sudo apt-get full-upgrade -y
# Remove unnecessary packages
echo "Cleaning up unnecessary packages..."
sudo apt autoremove -y
sudo apt-get autoremove -y
sudo apt autoclean -y
sudo apt-get clean -y
sudo apt-get dist-upgrade -y
echo "System update and upgrade process completed successfully!"
