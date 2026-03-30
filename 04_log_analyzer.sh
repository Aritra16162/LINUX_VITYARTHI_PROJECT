#!/bin/bash
# Script 4: Log File Analyzer
# Author: Aritra Dasgupta | Reg: 24BHI10017 
# Course: Open Source Software | VIT Bhopal University

LOGFILE=$1
KEYWORD=${2:-"error"}  # Default keyword is 'error' if none provided
COUNT=0

echo "=========================================================="
echo " Log File Analyzer"
echo "=========================================================="
echo "Log file : $LOGFILE"
echo "Keyword  : $KEYWORD"
echo "----------------------------------------------------------"

# Validate that a file path was actually provided
if [ -z "$LOGFILE" ]; then
    echo "Usage: $0 <logfile> [keyword]"
    echo "Example: $0 /var/log/syslog error"
    exit 1
fi

# Check that the file exists
if [ ! -f "$LOGFILE" ]; then
    echo "Error: File '$LOGFILE' not found."
    read -p "Press [Enter] to exit..."
    exit 1
fi

# Retry loop: wait up to 3 attempts for the file to contain data
# Useful when called right after a process starts writing the log
RETRY=0
while true; do
    if [ -s "$LOGFILE" ]; then
        break
    fi
    echo "Warning: File is currently empty. Retrying in 2 seconds... ($RETRY/3)"
    sleep 2
    RETRY=$((RETRY + 1))
    if [ $RETRY -ge 3 ]; then
        echo "Error: File is still empty after 3 attempts. Exiting."
        read -p "Press [Enter] to exit..."
        exit 1
    fi
done

# Read the file line by line and count keyword occurrences
# IFS= and -r prevent word-splitting and backslash interpretation
while IFS= read -r LINE; do
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
    fi
done < "$LOGFILE"

echo "Keyword '$KEYWORD' found $COUNT time(s) in $LOGFILE"

# If there are matches, show the most recent 5 for quick diagnosis
if [ $COUNT -gt 0 ]; then
    echo ""
    echo "--- Last 5 Matching Lines ---"
    grep -i "$KEYWORD" "$LOGFILE" | tail -n 5
fi

echo "=========================================================="
echo ""
read -p "Press [Enter] to exit..."