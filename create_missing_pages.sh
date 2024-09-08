#!/bin/bash

# Create content page
cat > src/app/content/page.tsx << EOF
export default function Content() {
  return (
    <div className="space-y-6">
      <h1 className="text-3xl font-serif font-bold gradient-text">Content</h1>
      <p className="text-lg">Explore and manage your content here.</p>
    </div>
  )
}
EOF

# Create chat page
cat > src/app/chat/page.tsx << EOF
export default function Chat() {
  return (
    <div className="space-y-6">
      <h1 className="text-3xl font-serif font-bold gradient-text">Chat</h1>
      <p className="text-lg">Connect with your audience through chat.</p>
    </div>
  )
}
EOF

# Create profile page
cat > src/app/profile/page.tsx << EOF
export default function Profile() {
  return (
    <div className="space-y-6">
      <h1 className="text-3xl font-serif font-bold gradient-text">Profile</h1>
      <p className="text-lg">Manage your profile and personal information.</p>
    </div>
  )
}
EOF

# Create stats page
cat > src/app/stats/page.tsx << EOF
export default function Stats() {
  return (
    <div className="space-y-6">
      <h1 className="text-3xl font-serif font-bold gradient-text">Stats</h1>
      <p className="text-lg">View your performance and engagement statistics.</p>
    </div>
  )
}
EOF

# Create settings page
cat > src/app/settings/page.tsx << EOF
export default function Settings() {
  return (
    <div className="space-y-6">
      <h1 className="text-3xl font-serif font-bold gradient-text">Settings</h1>
      <p className="text-lg">Customize your account settings and preferences.</p>
    </div>
  )
}
EOF

# Update layout.tsx to include ThemeProvider
cat > src/app/layout.tsx << EOF
import './globals.css'
import { Inter } from 'next/font/google'
import { ThemeProvider } from 'next-themes'
import Layout from '../components/Layout'

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
        <ThemeProvider attribute="class" defaultTheme="system" enableSystem>
          <Layout>{children}</Layout>
        </ThemeProvider>
      </body>
    </html>
  )
}
EOF

# Update PROJECT_LOG.md
./update_project.sh << EOF
Created missing pages and updated configurations:
- Added Content, Chat, Profile, Stats, and Settings pages
- Updated layout.tsx to include ThemeProvider for proper theme management
EOF

echo "Missing pages created and configurations updated. Please run 'npm run dev' to see the changes."
