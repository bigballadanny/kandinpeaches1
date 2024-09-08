#!/bin/bash

# Create a layout component
mkdir -p src/components
cat > src/components/Layout.tsx << EOF
import Link from 'next/link'

export default function Layout({ children }: { children: React.ReactNode }) {
  return (
    <div className="min-h-screen flex flex-col">
      <header className="bg-blue-600 text-white p-4">
        <nav className="container mx-auto flex justify-between items-center">
          <Link href="/" className="text-2xl font-bold">Synthios Dashboard</Link>
          <div className="space-x-4">
            <Link href="/content" className="hover:underline">Content</Link>
            <Link href="/analytics" className="hover:underline">Analytics</Link>
          </div>
        </nav>
      </header>
      <main className="flex-grow container mx-auto p-4">
        {children}
      </main>
      <footer className="bg-gray-200 p-4">
        <div className="container mx-auto text-center">
          © 2023 Synthios Dashboard. All rights reserved.
        </div>
      </footer>
    </div>
  )
}
EOF

# Update src/app/layout.tsx to use the new Layout component
cat > src/app/layout.tsx << EOF
import './globals.css'
import type { Metadata } from 'next'
import Layout from '@/components/Layout'

export const metadata: Metadata = {
  title: 'Synthios Dashboard',
  description: 'Efficient content management and analytics',
}

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="en">
      <body>
        <Layout>{children}</Layout>
      </body>
    </html>
  )
}
EOF

# Update src/app/page.tsx
cat > src/app/page.tsx << EOF
export default function Home() {
  return (
    <div className="space-y-6">
      <h1 className="text-4xl font-bold">Welcome to Synthios Dashboard</h1>
      <p className="text-xl">Manage your content and view analytics efficiently.</p>
      <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
        <div className="p-6 bg-white rounded-lg shadow-md">
          <h2 className="text-2xl font-semibold mb-2">Content Management</h2>
          <p>Create, edit, and organize your content with ease.</p>
        </div>
        <div className="p-6 bg-white rounded-lg shadow-md">
          <h2 className="text-2xl font-semibold mb-2">Analytics</h2>
          <p>Gain insights into your content's performance.</p>
        </div>
      </div>
    </div>
  )
}
EOF

# Update PROJECT_LOG.md
./update_project.sh << EOF
Implemented consistent layout across all pages:
- Created Layout component with header, footer, and navigation
- Updated RootLayout to use the new Layout component
- Redesigned the main dashboard page
- Applied Synthios principles of reusability and consistency
EOF

echo "Layout implementation completed. Please run 'npm run dev' to see the changes."
