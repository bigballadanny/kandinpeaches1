#!/bin/bash

# Clean up src/app/page.tsx
cat > src/app/page.tsx << EOF
import Link from 'next/link'

export default function Home() {
  return (
    <main className="flex min-h-screen flex-col items-center justify-between p-24">
      <h1 className="text-4xl font-bold mb-8">Dashboard</h1>
      <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
        <Link href="/content" className="p-6 bg-white rounded-lg shadow-md hover:shadow-lg transition-shadow">
          <h2 className="text-2xl font-semibold mb-2">Content</h2>
          <p>Manage your content</p>
        </Link>
        <Link href="/analytics" className="p-6 bg-white rounded-lg shadow-md hover:shadow-lg transition-shadow">
          <h2 className="text-2xl font-semibold mb-2">Analytics</h2>
          <p>View performance metrics</p>
        </Link>
      </div>
    </main>
  )
}
EOF

# Update src/app/content/page.tsx
mkdir -p src/app/content
cat > src/app/content/page.tsx << EOF
'use client'

import { useState } from 'react'

export default function Content() {
  const [contents, setContents] = useState([
    { id: 1, title: 'First Content', body: 'This is the first content item.' },
    { id: 2, title: 'Second Content', body: 'This is the second content item.' },
  ])

  const [newTitle, setNewTitle] = useState('')
  const [newBody, setNewBody] = useState('')

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault()
    const newContent = {
      id: contents.length + 1,
      title: newTitle,
      body: newBody,
    }
    setContents([...contents, newContent])
    setNewTitle('')
    setNewBody('')
  }

  return (
    <div className="p-24">
      <h1 className="text-4xl font-bold mb-8">Content Management</h1>
      
      <form onSubmit={handleSubmit} className="mb-8">
        <input
          type="text"
          value={newTitle}
          onChange={(e) => setNewTitle(e.target.value)}
          placeholder="Title"
          className="w-full p-2 mb-4 border rounded"
        />
        <textarea
          value={newBody}
          onChange={(e) => setNewBody(e.target.value)}
          placeholder="Content body"
          className="w-full p-2 mb-4 border rounded"
        />
        <button type="submit" className="px-4 py-2 bg-blue-500 text-white rounded">
          Add Content
        </button>
      </form>

      <div>
        {contents.map((content) => (
          <div key={content.id} className="mb-4 p-4 border rounded">
            <h2 className="text-xl font-bold">{content.title}</h2>
            <p>{content.body}</p>
          </div>
        ))}
      </div>
    </div>
  )
}
EOF

# Update src/app/analytics/page.tsx
cat > src/app/analytics/page.tsx << EOF
export default function Analytics() {
  return (
    <div className="p-24">
      <h1 className="text-4xl font-bold mb-8">Analytics</h1>
      <p>Analytics dashboard will be implemented here.</p>
    </div>
  )
}
EOF

# Remove unnecessary files
rm -rf src/components
rm -rf src/app/content-creator

# Update PROJECT_LOG.md
./update_project.sh << EOF
Cleaned up codebase:
- Simplified main dashboard
- Consolidated content management into a single page
- Removed unnecessary components
- Prepared for future analytics implementation
EOF

echo "Code cleanup completed. Please run 'npm run dev' to see the changes."
