#!/bin/bash

# Update tailwind.config.js with new color scheme
cat > tailwind.config.js << EOF
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './src/pages/**/*.{js,ts,jsx,tsx,mdx}',
    './src/components/**/*.{js,ts,jsx,tsx,mdx}',
    './src/app/**/*.{js,ts,jsx,tsx,mdx}',
  ],
  theme: {
    extend: {
      colors: {
        'miami-pink': '#ff6b6b',
        'miami-blue': '#4ecdc4',
        'miami-purple': '#6c5ce7',
        'miami-orange': '#ffa502',
        'dark-bg': '#1e1e2e',
        'light-bg': '#2d2d44',
      },
      fontFamily: {
        'retro': ['VT323', 'monospace'],
        'modern': ['Roboto', 'sans-serif'],
      },
    },
  },
  plugins: [],
}
EOF

# Update globals.css
cat > src/app/globals.css << EOF
@import url('https://fonts.googleapis.com/css2?family=VT323&family=Roboto:wght@400;700&display=swap');

@tailwind base;
@tailwind components;
@tailwind utilities;

body {
  @apply bg-dark-bg text-white font-modern;
}

h1, h2, h3, h4, h5, h6 {
  @apply font-retro;
}
EOF

# Update Layout component
cat > src/components/Layout.tsx << EOF
import Link from 'next/link'

export default function Layout({ children }: { children: React.ReactNode }) {
  return (
    <div className="flex h-screen bg-dark-bg text-white">
      <nav className="w-64 bg-light-bg p-6 space-y-4">
        <h1 className="text-3xl font-retro text-miami-pink">Miami AI Creator</h1>
        <ul className="space-y-2">
          <li><Link href="/" className="block p-2 rounded hover:bg-miami-blue hover:text-dark-bg transition-colors">Home</Link></li>
          <li><Link href="/content" className="block p-2 rounded hover:bg-miami-blue hover:text-dark-bg transition-colors">Content</Link></li>
          <li><Link href="/chat" className="block p-2 rounded hover:bg-miami-blue hover:text-dark-bg transition-colors">Chat</Link></li>
          <li><Link href="/profile" className="block p-2 rounded hover:bg-miami-blue hover:text-dark-bg transition-colors">Profile</Link></li>
          <li><Link href="/stats" className="block p-2 rounded hover:bg-miami-blue hover:text-dark-bg transition-colors">Stats</Link></li>
          <li><Link href="/settings" className="block p-2 rounded hover:bg-miami-blue hover:text-dark-bg transition-colors">Settings</Link></li>
        </ul>
      </nav>
      <main className="flex-1 p-8 overflow-auto">
        {children}
      </main>
    </div>
  )
}
EOF

# Update homepage
cat > src/app/page.tsx << EOF
import Link from 'next/link'

export default function Home() {
  return (
    <div className="space-y-8">
      <h1 className="text-4xl font-retro text-miami-pink">Dashboard</h1>
      
      <div className="bg-light-bg p-6 rounded-lg shadow-lg">
        <h2 className="text-2xl font-retro mb-4 text-miami-blue">Mission Control</h2>
        <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
          <div className="bg-dark-bg p-4 rounded">
            <h3 className="text-xl font-retro mb-2 text-miami-orange">Daily Challenge</h3>
            <p>Create a neon-themed video</p>
          </div>
          <div className="bg-dark-bg p-4 rounded">
            <h3 className="text-xl font-retro mb-2 text-miami-orange">Followers</h3>
            <p className="text-4xl font-retro">1,337</p>
          </div>
          <div className="bg-dark-bg p-4 rounded">
            <h3 className="text-xl font-retro mb-2 text-miami-orange">Level</h3>
            <div className="w-full bg-light-bg rounded-full h-4">
              <div className="bg-gradient-to-r from-miami-pink to-miami-purple h-4 rounded-full" style={{width: '70%'}}></div>
            </div>
            <p className="text-right">7</p>
          </div>
        </div>
      </div>
      
      <div className="bg-light-bg p-6 rounded-lg shadow-lg">
        <h2 className="text-2xl font-retro mb-4 text-miami-blue">Content Feed</h2>
        <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
          {['Neon Nights 1', 'Neon Nights 2', 'Neon Nights 3'].map((title, index) => (
            <div key={index} className="bg-gradient-to-br from-miami-pink to-miami-purple p-4 rounded-lg aspect-video flex items-end">
              <h3 className="text-xl font-retro text-white">{title}</h3>
            </div>
          ))}
        </div>
      </div>
    </div>
  )
}
EOF

# Update PROJECT_LOG.md
./update_project.sh << EOF
Implemented Miami AI Creator dashboard:
- Updated color scheme and typography
- Created new Layout component with sidebar navigation
- Redesigned homepage with Mission Control and Content Feed sections
- Applied retro-futuristic styling throughout
EOF

echo "Miami AI Creator dashboard implemented. Please run 'npm run dev' to see the changes."
