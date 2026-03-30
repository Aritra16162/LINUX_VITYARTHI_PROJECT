#!/bin/bash
# Script 1: System Identity Report
# Author: Aritra Dasgupta | Reg: 24BHI10025
# Course: Open Source Software | VIT Bhopal University
# Chosen Software: LibreOffice

# --- Variables ---
STUDENT_NAME="Aritra Dasgupta"
REG_NO="24BHI10017 "
SOFTWARE_CHOICE="LibreOffice"

# --- Collect system information using command substitution ---
KERNEL=$(uname -r)
USER_NAME=$(whoami)
UPTIME=$(uptime -p 2>/dev/null || uptime)
DISTRO=$(uname -o)
ARCH=$(uname -m)
HOME_DIR=$HOME
HOSTNAME=$(hostname)
CURRENT_DATE=$(date)

# --- Display formatted output ---
echo "=========================================================="
echo "      Open Source Audit - $STUDENT_NAME ($REG_NO)"
echo "=========================================================="
echo "Software Choice  : $SOFTWARE_CHOICE"
echo "Distribution     : $DISTRO"
echo "Architecture     : $ARCH"
echo "Kernel Version   : $KERNEL"
echo "Hostname         : $HOSTNAME"
echo "Current User     : $USER_NAME"
echo "Home Directory   : $HOME_DIR"
echo "System Uptime    : $UPTIME"
echo "Date & Time      : $CURRENT_DATE"
echo "----------------------------------------------------------"
echo "License Notice:"
echo "This Linux system operates under the GPL licence."
echo "LibreOffice is distributed under the MPL 2.0."
echo "=========================================================="

echo ""
read -p "Press [Enter] to exit..."