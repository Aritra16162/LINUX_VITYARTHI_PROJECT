#!/bin/bash
# Script 2: FOSS Package Inspector
# Author: Aritra Dasgupta  | Reg: 24BHI10017
# Course: Open Source Software | VIT Bhopal University

PACKAGE="libreoffice"

echo "=========================================================="
echo " FOSS Package Inspector"
echo "=========================================================="
echo "Checking for package: $PACKAGE"
echo "----------------------------------------------------------"

# Check if the package is installed using dpkg or by looking for the binary
if dpkg -l "$PACKAGE" &>/dev/null || command -v soffice &>/dev/null; then
    echo "$PACKAGE is INSTALLED on this system."

    # If dpkg is available (Debian/Ubuntu), extract version and description
    if command -v dpkg &>/dev/null && dpkg -s "$PACKAGE" &>/dev/null; then
        dpkg -s "$PACKAGE" | grep -E '^Version|^Description' | head -n 2
    else
        # Fallback: ask the binary directly
        echo "Version: $(soffice --version 2>/dev/null)"
    fi
else
    echo "$PACKAGE is NOT installed on this system."
    echo "Install it with: sudo apt install libreoffice"
fi

echo "----------------------------------------------------------"

# Use a case statement to print a relevant fact about the chosen software
case $PACKAGE in
    libreoffice)
        echo "LibreOffice: the community's answer to expensive office suites."
        echo "Born from the OpenOffice fork in 2010, it is now used by"
        echo "governments, schools, and individuals across the world - for free."
        ;;
    gimp)
        echo "GIMP: professional image editing without the price tag."
        ;;
    git)
        echo "Git: the version control system that powers open-source collaboration."
        ;;
    firefox)
        echo "Firefox: the browser fighting for a free and open web."
        ;;
    *)
        echo "$PACKAGE: another valuable tool in the FOSS ecosystem."
        ;;
esac

echo "=========================================================="
echo ""
read -p "Press [Enter] to exit..."