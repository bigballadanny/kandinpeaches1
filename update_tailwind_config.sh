#!/bin/bash

# Update tailwind.config.js
cat > tailwind.config.js << EOF
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './src/pages/**/*.{js,ts,jsx,tsx,mdx}',
    './src/components/**/*.{js,ts,jsx,tsx,mdx}',
    './src/app/**/*.{js,ts,jsx,tsx,mdx}',
  ],
  theme: {
    extend: {
      colors: {
        'luxury-gold': '#D4AF37',
        'deep-purple': '#4A0E4E',
        'midnight-blue': '#191970',
        'soft-cream': '#F5E6D3',
        'charcoal': '#36454F',
      },
      fontFamily: {
        'sans': ['Montserrat', 'sans-serif'],
        'serif': ['Playfair Display', 'serif'],
      },
    },
  },
  plugins: [],
  darkMode: 'class',
}
EOF

# Update PROJECT_LOG.md
./update_project.sh << EOF
Updated tailwind.config.js:
- Added custom colors
- Set up custom font families
EOF

echo "tailwind.config.js updated with custom configuration. Please run 'npm run dev' to see the changes."
