#!/bin/bash

# Run the Python script
python update_project_log.py

# Git operations
git add .
git commit -m "Update project files and PROJECT_LOG.md"
git push

echo "Project updated and changes pushed to GitHub."
