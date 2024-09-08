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
