'use client'

import React from 'react'
import Link from 'next/link'
import { usePathname } from 'next/navigation'

export default function ClientLayout({ children }: { children: React.ReactNode }) {
  const pathname = usePathname()

  return (
    <div className="flex h-screen bg-gradient-to-br from-soft-cream to-white dark:from-midnight-blue dark:to-deep-purple text-charcoal dark:text-soft-cream">
      <nav className="w-64 bg-white dark:bg-midnight-blue p-6 space-y-6">
        <h1 className="text-2xl font-serif font-bold text-luxury-gold">Miami AI Creator</h1>
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
                className={}
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
