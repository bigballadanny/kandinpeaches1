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
              className: 
            }, item.name)
          )
        )
      )
    ),
    React.createElement('main', { className: "flex-1 p-8 overflow-auto" }, children)
  )
}
