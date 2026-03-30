#!/bin/bash
# Script 3: Disk and Permission Auditor
# Author: Aritra Dasgupta | Reg: 24BHI10017
# Course: Open Source Software | VIT Bhopal University
# Audits directories relevant to a LibreOffice Linux installation

# Define directories to audit - mix of LibreOffice locations and standard system dirs
DIRS=("/usr/lib/libreoffice" "/usr/share/libreoffice" "/usr/bin" "/etc" "/var/log" "/tmp")

echo "=========================================================="
echo " Directory Audit Report - LibreOffice / System"
echo "=========================================================="

for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        # Extract permission string and owner/group using awk on ls output
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')

        # Get human-readable directory size using du, cut to first column
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)

        # Get filesystem usage percentage using df, awk to grab the 5th column of row 2
        FS_USAGE=$(df -h "$DIR" 2>/dev/null | awk 'NR==2 {print $5}')

        echo "$DIR"
        echo "  Permissions : $PERMS"
        echo "  Size        : ${SIZE:-N/A}"
        echo "  Disk Used   : ${FS_USAGE:-N/A}"
        echo "  ----------"
    else
        echo "$DIR - does not exist on this system (package may not be installed)"
        echo "  ----------"
    fi
done

# Check for user-specific LibreOffice configuration directory
LO_CONFIG="$HOME/.config/libreoffice"
echo ""
echo "Checking user LibreOffice config..."
if [ -d "$LO_CONFIG" ]; then
    LO_PERMS=$(ls -ld "$LO_CONFIG" | awk '{print $1, $3, $4}')
    LO_SIZE=$(du -sh "$LO_CONFIG" 2>/dev/null | cut -f1)
    echo "Found: $LO_CONFIG"
    echo "  Permissions : $LO_PERMS"
    echo "  Size        : ${LO_SIZE:-N/A}"
else
    echo "Not found: $LO_CONFIG"
    echo "  (LibreOffice may not have been launched yet, or is not installed)"
fi

echo "=========================================================="
echo ""
read -p "Press [Enter] to exit..."