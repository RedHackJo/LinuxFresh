#!/bin/bash

# LinuxFresh 🍃
# A comprehensive Bash script to automate the maintenance of Debian-based Linux systems.

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color
BOLD='\033[1m'

# --- Self-Update Logic ---
echo "Checking for script updates..."
git fetch origin main &> /dev/null
UPSTREAM=${1:-'@{u}'}
LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse "$UPSTREAM")

if [ $LOCAL != $REMOTE ]; then
    echo "A new version of LinuxFresh is available. Updating..."
    git pull origin main
    echo "Update complete! Restarting script..."
    exec "$0" "$@"
fi
echo "You are running the latest version."
# --- End of Self-Update Logic ---

# ASCII Logo
show_logo() {
    echo -e "${GREEN}${BOLD}"
    echo "  _      _                      ______               _      "
    echo " | |    (_)                    |  ____|             | |     "
    echo " | |     _ _ __  _   ___  __   | |__   _ __ ___  ___| |__   "
    echo " | |    | | '_ \| | | \ \/ /   |  __| | '__/ _ \/ __| '_ \  "
    echo " | |____| | | | | |_| |>  <    | |    | | |  __/\__ \ | | | "
    echo " |______|_|_| |_|\__,_/_/\_\   |_|    |_|  \___||___/_| |_| "
    echo -e "                                                  ${NC}🍃"
    echo -e "${BLUE}    Automated System Maintenance for Debian-based Linux${NC}\n"
}

# Check for root privileges
check_root() {
    if [ "$EUID" -ne 0 ]; then
        echo -e "${RED}${BOLD}Error:${NC} Please run this script with sudo or as root."
        exit 1
    fi
}

# Function to run commands with verbose output
run_process() {
    local message=$1
    local command=$2
    
    echo -e "${YELLOW}${BOLD}>>${NC} ${message}"
    echo -e "${BLUE}Running command:${NC} ${BOLD}${command}${NC}"
    
    if eval "$command"; then
        echo -e "${GREEN}DONE: ${message}${NC}\n"
    else
        echo -e "\n${RED}FAILED: ${message}${NC}"
        echo -e "${RED}${BOLD}Warning:${NC} Potential issue during '$message'. Continuing...\n"
    fi
}

# --- Main Script Start ---

show_logo
check_root

echo -e "${BLUE}${BOLD}Starting system update and upgrade process...${NC}\n"

# Update package lists
run_process "Updating package lists" "apt update -y"

# Upgrade installed packages
run_process "Upgrading installed packages" "apt upgrade -y"

# Full upgrade (handles changing dependencies)
run_process "Performing full upgrade" "apt full-upgrade -y"

# Cleanup
echo -e "\n${BLUE}${BOLD}Cleaning up unnecessary packages and files...${NC}"
run_process "Removing obsolete packages (autoremove)" "apt autoremove -y"
run_process "Clearing local cache (autoclean)" "apt autoclean -y"
run_process "Performing package cleanup (clean)" "apt clean"

echo -e "\n${GREEN}${BOLD}✔ System update and upgrade process completed successfully!${NC}"
echo -e "${BLUE}Your Linux system is now fresh and ready to go. 🍃${NC}"
