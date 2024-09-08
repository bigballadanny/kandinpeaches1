#!/bin/bash

# Simplify Layout component
cat > src/components/Layout.tsx << EOF
'use client'

import React from 'react'
import Link from 'next/link'

export default function Layout({ children }: { children: React.ReactNode }) {
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
EOF

# Update PROJECT_LOG.md
./update_project.sh << EOF
Simplified Layout component:
- Removed complex JSX and styling to isolate the issue
EOF

echo "Layout component simplified. Please run 'npm run dev' to see the changes."
