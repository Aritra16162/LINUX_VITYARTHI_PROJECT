#!/bin/bash
# Script 5: Open Source Manifesto Generator
# Author: Aritra Dasgupta | Reg: 24BHI10017
# Course: Open Source Software | VIT Bhopal University

echo "=========================================================="
echo " Open Source Manifesto Generator"
echo " Inspired by LibreOffice and the FOSS Community"
echo "=========================================================="
echo "Answer three questions to generate your manifesto."
echo ""

# Collect user input interactively using read -p
read -p "1. Name one LibreOffice feature that impressed you: " FEATURE
read -p "2. In one word, what does 'open source' mean to you? " WORD
read -p "3. Name one thing you would build and share freely: " BUILD

# Build the output filename dynamically using the current username
DATE=$(date '+%d %B %Y')
OUTPUT="manifesto_$(whoami).txt"

# Write the manifesto to file
# > creates/overwrites the file; >> appends each subsequent line
echo "### My Open Source Manifesto ###" > "$OUTPUT"
echo "Date: $DATE" >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "I believe in open source because tools like LibreOffice - with" >> "$OUTPUT"
echo "features like $FEATURE - prove that world-class software can" >> "$OUTPUT"
echo "be built and shared without charging anyone a single rupee." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "To me, open source means $WORD. It is not just a licence;" >> "$OUTPUT"
echo "it is a philosophy that says knowledge grows when it is shared." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "If I had the chance to contribute, I would build $BUILD" >> "$OUTPUT"
echo "and release it freely, so that someone else can build on top of it." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "- $(whoami) | $(date '+%d %B %Y')" >> "$OUTPUT"

echo ""
echo "Manifesto saved to: $OUTPUT"
echo "----------------------------------------------------------"

# Display the generated file immediately
cat "$OUTPUT"

echo "=========================================================="
echo ""
read -p "Press [Enter] to exit..."