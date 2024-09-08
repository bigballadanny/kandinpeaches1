#!/bin/bash

# Update globals.css with adjusted neon effect and theme variables
cat > src/app/globals.css << EOF
@import url('https://fonts.googleapis.com/css2?family=VT323&family=Roboto:wght@400;700&display=swap');

@tailwind base;
@tailwind components;
@tailwind utilities;

:root {
  --foreground-rgb: 255, 255, 255;
  --background-start-rgb: 0, 0, 0;
  --background-end-rgb: 0, 0, 0;
}

[data-theme="light"] {
  --foreground-rgb: 0, 0, 0;
  --background-start-rgb: 214, 219, 220;
  --background-end-rgb: 255, 255, 255;
}

body {
  color: rgb(var(--foreground-rgb));
  background: linear-gradient(
    to bottom,
    transparent,
    rgb(var(--background-end-rgb))
  )
  rgb(var(--background-start-rgb));
}

.neon-text {
  text-shadow: 0 0 5px #fff, 0 0 10px #fff, 0 0 15px #ff00de, 0 0 20px #ff00de, 0 0 35px #ff00de;
}

.glass-card {
  background: rgba(255, 255, 255, 0.1);
  backdrop-filter: blur(10px);
  border-radius: 10px;
  border: 1px solid rgba(255, 255, 255, 0.2);
  box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
}

.gradient-bg {
  background: linear-gradient(45deg, #ff6b6b, #4ecdc4, #6c5ce7, #ffa502);
  background-size: 400% 400%;
  animation: gradient 15s ease infinite;
}

@keyframes gradient {
  0% { background-position: 0% 50%; }
  50% { background-position: 100% 50%; }
  100% { background-position: 0% 50%; }
}
EOF

# Create ThemeToggle component
cat > src/components/ThemeToggle.tsx << EOF
'use client'

import React, { useState, useEffect } from 'react';

const ThemeToggle: React.FC = () => {
  const [isDark, setIsDark] = useState(true);

  useEffect(() => {
    document.documentElement.setAttribute('data-theme', isDark ? 'dark' : 'light');
  }, [isDark]);

  return (
    <button
      onClick={() => setIsDark(!isDark)}
      className="p-2 rounded-full bg-gray-200 dark:bg-gray-800 transition-colors"
    >
      {isDark ? '🌙' : '☀️'}
    </button>
  );
};

export default ThemeToggle;
EOF

# Update Layout component to include ThemeToggle
cat > src/components/Layout.tsx << EOF
import Link from 'next/link'
import dynamic from 'next/dynamic'

const ThemeToggle = dynamic(() => import('./ThemeToggle'), { ssr: false })

export default function Layout({ children }: { children: React.ReactNode }) {
  return (
    <div className="flex h-screen bg-gradient-to-br from-pink-500 to-orange-400 dark:from-purple-900 dark:to-blue-900 text-black dark:text-white transition-colors duration-300">
      <nav className="w-64 glass-card p-6 space-y-4 m-4 rounded-lg">
        <div className="flex justify-between items-center">
          <h1 className="text-3xl font-retro neon-text">Miami AI Creator</h1>
          <ThemeToggle />
        </div>
        <ul className="space-y-2">
          <li><Link href="/" className="block p-2 rounded hover:bg-miami-blue hover:text-dark-bg transition-all">Home</Link></li>
          <li><Link href="/content" className="block p-2 rounded hover:bg-miami-blue hover:text-dark-bg transition-all">Content</Link></li>
          <li><Link href="/chat" className="block p-2 rounded hover:bg-miami-blue hover:text-dark-bg transition-all">Chat</Link></li>
          <li><Link href="/profile" className="block p-2 rounded hover:bg-miami-blue hover:text-dark-bg transition-all">Profile</Link></li>
          <li><Link href="/stats" className="block p-2 rounded hover:bg-miami-blue hover:text-dark-bg transition-all">Stats</Link></li>
          <li><Link href="/settings" className="block p-2 rounded hover:bg-miami-blue hover:text-dark-bg transition-all">Settings</Link></li>
        </ul>
      </nav>
      <main className="flex-1 p-8 overflow-auto">
        {children}
      </main>
    </div>
  )
}
EOF

# Update PROJECT_LOG.md
./update_project.sh << EOF
Updated UI and added theme toggle:
- Adjusted neon text effect for better legibility
- Implemented light/dark mode with theme toggle
- Updated Layout component with new styling
EOF

echo "UI updated and theme toggle added. Please run 'npm run dev' to see the changes."
