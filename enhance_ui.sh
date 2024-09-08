#!/bin/bash

# Update globals.css with new styles
cat >> src/app/globals.css << EOF

/* Modern card effect */
.glass-card {
  background: rgba(255, 255, 255, 0.1);
  backdrop-filter: blur(10px);
  border-radius: 10px;
  border: 1px solid rgba(255, 255, 255, 0.2);
  box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
}

/* Neon text effect */
.neon-text {
  text-shadow: 0 0 5px #fff, 0 0 10px #fff, 0 0 15px #fff, 0 0 20px #ff00de, 0 0 35px #ff00de, 0 0 40px #ff00de, 0 0 50px #ff00de, 0 0 75px #ff00de;
}

/* Gradient background */
.gradient-bg {
  background: linear-gradient(45deg, #ff6b6b, #4ecdc4, #6c5ce7, #ffa502);
  background-size: 400% 400%;
  animation: gradient 15s ease infinite;
}

@keyframes gradient {
  0% {
    background-position: 0% 50%;
  }
  50% {
    background-position: 100% 50%;
  }
  100% {
    background-position: 0% 50%;
  }
}

/* Smooth transitions */
.transition-all {
  transition: all 0.3s ease;
}
EOF

# Update Layout component with new styles
cat > src/components/Layout.tsx << EOF
import Link from 'next/link'

export default function Layout({ children }: { children: React.ReactNode }) {
  return (
    <div className="flex h-screen bg-dark-bg text-white gradient-bg">
      <nav className="w-64 glass-card p-6 space-y-4 m-4 rounded-lg">
        <h1 className="text-3xl font-retro neon-text">Miami AI Creator</h1>
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
Enhanced UI:
- Added glass morphism effect for cards
- Implemented neon text effect
- Created gradient background with animation
- Updated Layout component with new styles
EOF

echo "UI enhancements added. Please run 'npm run dev' to see the changes."
