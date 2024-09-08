#!/bin/bash

# Update root layout
cat > src/app/layout.tsx << EOF
import './globals.css'
import { Inter } from 'next/font/google'
import ClientLayout from '../components/ClientLayout'

const inter = Inter({ subsets: ['latin'] })

export const metadata = {
  title: 'Miami AI Creator',
  description: 'Luxury content creation platform',
}

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="en">
      <body className={inter.className}>
        <ClientLayout>{children}</ClientLayout>
      </body>
    </html>
  )
}
EOF

# Update PROJECT_LOG.md
./update_project.sh << EOF
Updated root layout:
- Directly imported and used ClientLayout
EOF

echo "Root layout updated. Please run 'npm run dev' to see the changes."
