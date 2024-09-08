'use client'

import React from 'react'
import Link from 'next/link'

export default function ClientLayout({ children }: { children: React.ReactNode }) {
  return (
    <div>
      <nav>
        <ul>
          <li><Link href="/">Home</Link></li>
          <li><Link href="/content">Content</Link></li>
          <li><Link href="/chat">Chat</Link></li>
          <li><Link href="/profile">Profile</Link></li>
          <li><Link href="/stats">Stats</Link></li>
          <li><Link href="/settings">Settings</Link></li>
        </ul>
      </nav>
      <main>{children}</main>
    </div>
  )
}
