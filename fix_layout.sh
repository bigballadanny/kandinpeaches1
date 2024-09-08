#!/bin/bash

# Update Layout component
cat > src/components/Layout.tsx << EOF
'use client'

import React from 'react'
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

# Update PROJECT_LOG.md
./update_project.sh << EOF
Fixed Layout component:
- Added React import
- Ensured proper JSX formatting
EOF

echo "Layout component fixed. Please run 'npm run dev' to see the changes."
