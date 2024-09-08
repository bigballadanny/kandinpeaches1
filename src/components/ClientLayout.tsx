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

  return (
    <div className="flex min-h-screen">
      <nav className="w-64 bg-white dark:bg-miami-dark p-6 space-y-6">
        <h1 className="text-2xl font-serif font-bold text-miami-pink">Miami AI Creator</h1>
        <ul className="space-y-2">
          {navItems.map((item) => (
            <li key={item.name}>
              <Link 
                href={item.path} 
                className="block p-2 rounded transition-all hover:bg-miami-light dark:hover:bg-miami-dark"
              >
                {item.name}
              </Link>
            </li>
          ))}
        </ul>
      </nav>
      <main className="flex-1 p-8 overflow-auto">{children}</main>
    </div>
  )
}
