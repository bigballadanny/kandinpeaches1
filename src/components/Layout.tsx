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
