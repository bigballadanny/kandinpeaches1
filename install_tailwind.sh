#!/bin/bash

# Install Tailwind CSS and its dependencies
npm install -D tailwindcss@latest postcss@latest autoprefixer@latest

# Initialize Tailwind CSS
npx tailwindcss init -p

# Update PROJECT_LOG.md
./update_project.sh << EOF
Installed and configured Tailwind CSS:
- Installed tailwindcss, postcss, and autoprefixer
- Initialized Tailwind CSS configuration
EOF

echo "Tailwind CSS has been installed and configured. Please run 'npm run dev' to see the changes."
