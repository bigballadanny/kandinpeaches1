#!/bin/bash

# Update tailwind.config.js with new color scheme
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

# Update globals.css
cat > src/app/globals.css << EOF
@import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;600;700&family=Playfair+Display:wght@400;700&display=swap');

@tailwind base;
@tailwind components;
@tailwind utilities;

:root {
  --foreground-rgb: 54, 69, 79;
  --background-start-rgb: 245, 230, 211;
  --background-end-rgb: 255, 255, 255;
}

.dark {
  --foreground-rgb: 245, 230, 211;
  --background-start-rgb: 25, 25, 112;
  --background-end-rgb: 74, 14, 78;
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

.luxury-card {
  background: rgba(255, 255, 255, 0.1);
  backdrop-filter: blur(10px);
  border-radius: 10px;
  border: 1px solid rgba(212, 175, 55, 0.2);
  box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
}

.gradient-text {
  background: linear-gradient(45deg, #D4AF37, #4A0E4E);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
  text-fill-color: transparent;
}
EOF

# Update Layout component
cat > src/components/Layout.tsx << EOF
'use client'

import Link from 'next/link'
import { usePathname } from 'next/navigation'
import ThemeToggle from './ThemeToggle'

export default function Layout({ children }: { children: React.ReactNode }) {
  const pathname = usePathname()

  return (
    <div className="flex h-screen bg-gradient-to-br from-soft-cream to-white dark:from-midnight-blue dark:to-deep-purple text-charcoal dark:text-soft-cream transition-colors duration-300">
      <nav className="w-64 luxury-card p-6 space-y-6 m-4 rounded-lg">
        <div className="flex justify-between items-center">
          <h1 className="text-2xl font-serif font-bold gradient-text">Miami AI Creator</h1>
          <ThemeToggle />
        </div>
        <ul className="space-y-2">
          {[
            { name: 'Home', path: '/' },
            { name: 'Content', path: '/content' },
            { name: 'Chat', path: '/chat' },
            { name: 'Profile', path: '/profile' },
            { name: 'Stats', path: '/stats' },
            { name: 'Settings', path: '/settings' },
          ].map((item) => (
            <li key={item.name}>
              <Link 
                href={item.path} 
                className={`block p-2 rounded transition-all ${
                  pathname === item.path 
                    ? 'bg-luxury-gold text-midnight-blue' 
                    : 'hover:bg-luxury-gold hover:text-midnight-blue'
                }`}
              >
                {item.name}
              </Link>
            </li>
          ))}
        </ul>
      </nav>
      <main className="flex-1 p-8 overflow-auto">
        {children}
      </main>
    </div>
  )
}
EOF

# Update ThemeToggle component
cat > src/components/ThemeToggle.tsx << EOF
'use client'

import { useState, useEffect } from 'react'
import { useTheme } from 'next-themes'

export default function ThemeToggle() {
  const [mounted, setMounted] = useState(false)
  const { theme, setTheme } = useTheme()

  useEffect(() => setMounted(true), [])

  if (!mounted) return null

  return (
    <button
      onClick={() => setTheme(theme === 'dark' ? 'light' : 'dark')}
      className="p-2 rounded-full bg-luxury-gold text-midnight-blue"
    >
      {theme === 'dark' ? '🌙' : '☀️'}
    </button>
  )
}
EOF

# Update PROJECT_LOG.md
./update_project.sh << EOF
Refined UI for a more luxurious look:
- Updated color scheme with gold, deep purple, and midnight blue
- Changed typography to Montserrat and Playfair Display
- Improved Layout component with active link highlighting
- Updated ThemeToggle to use next-themes for better theme management
EOF

echo "UI refined for a more luxurious look. Please run 'npm run dev' to see the changes."
