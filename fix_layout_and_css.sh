#!/bin/bash

# Create globals.css file
cat > src/app/globals.css << EOF
@tailwind base;
@tailwind components;
@tailwind utilities;

:root {
  --foreground-rgb: 0, 0, 0;
  --background-start-rgb: 214, 219, 220;
  --background-end-rgb: 255, 255, 255;
}

body {
  color: rgb(var(--foreground-rgb));
  background: linear-gradient(
      to bottom,
      transparent,
      rgb(var(--background-end-rgb))
    )
    rgb(var(--background-start-rgb));
}
EOF

# Update src/app/layout.tsx to use the correct import path for Layout
sed -i "s|import Layout from '@/components/Layout'|import Layout from '../components/Layout'|g" src/app/layout.tsx

# Ensure tailwind.config.js exists and is configured correctly
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
      backgroundImage: {
        'gradient-radial': 'radial-gradient(var(--tw-gradient-stops))',
        'gradient-conic':
          'conic-gradient(from 180deg at 50% 50%, var(--tw-gradient-stops))',
      },
    },
  },
  plugins: [],
}
EOF

# Update PROJECT_LOG.md
./update_project.sh << EOF
Fixed layout and CSS issues:
- Created globals.css file with Tailwind directives
- Updated layout.tsx to use correct import path for Layout component
- Ensured tailwind.config.js is properly configured
EOF

echo "Layout and CSS fixes applied. Please run 'npm run dev' to see the changes."
