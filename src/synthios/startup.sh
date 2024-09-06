#!/bin/bash

echo "Welcome to Team Synthios Workspace!"
echo "To begin, say 'Go Synthios!'"

while true; do
    read -p "> " command
    if [[ $command == "Go Synthios!"* ]]; then
        break
    else
        echo "To start your session, please say 'Go Synthios!'"
    fi
done

echo "Excellent! Entering the Synthios workspace..."

# Rest of the startup script...
# (Previous content remains here)

# Add a section to display active notes
echo "Recent active notes:"
tail -n 5 src/synthios/workspace/active_notes.md

echo "Session started. Let's rock, Team Synthios!"
