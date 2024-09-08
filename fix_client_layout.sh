#!/bin/bash

# Fix ClientLayout component
cat > src/components/ClientLayout.tsx << EOF
'use client'

import React from 'react'
import Link from 'next/link'
import { usePathname } from 'next/navigation'

const navItems = [
  { name: 'Dashboard', path: '/' },
  { name: 'Content Creation', path: '/content' },
  { name: 'AI Assistant', path: '/ai-assistant' },
  { name: 'Profile', path: '/profile' },
  { name: 'Settings', path: '/settings' },
]

export default function ClientLayout({ children }: { children: React.ReactNode }) {
  const pathname = usePathname()

  return React.createElement('div', { className: "flex min-h-screen" },
    React.createElement('nav', { className: "w-64 bg-white dark:bg-miami-dark p-6 space-y-6" },
      React.createElement('h1', { className: "text-2xl font-serif font-bold text-miami-pink" }, "Miami AI Creator"),
      React.createElement('ul', { className: "space-y-2" },
        navItems.map((item) => 
          React.createElement('li', { key: item.name },
            React.createElement(Link, { 
              href: item.path,
              className: `block p-2 rounded transition-all ${
                pathname === item.path 
                  ? 'bg-miami-pink text-white' 
                  : 'hover:bg-miami-light dark:hover:bg-miami-dark'
              }`
            }, item.name)
          )
        )
      )
    ),
    React.createElement('main', { className: "flex-1 p-8 overflow-auto" }, children)
  )
}
EOF

# Update PROJECT_LOG.md
./update_project.sh << EOF
Fixed ClientLayout component:
- Corrected syntax errors in React.createElement calls
EOF

echo "ClientLayout component fixed. Please run 'npm run dev' to see the changes."
