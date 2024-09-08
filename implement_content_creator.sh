#!/bin/bash

# Create src/components/ContentForm.tsx
mkdir -p src/components
cat > src/components/ContentForm.tsx << EOF
'use client'

import { useState } from 'react'

export default function ContentForm() {
  const [title, setTitle] = useState('')
  const [content, setContent] = useState('')

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault()
    console.log('Submitted:', { title, content })
    // Here you would typically send this data to your backend
    setTitle('')
    setContent('')
  }

  return (
    <form onSubmit={handleSubmit} className="space-y-4">
      <div>
        <label htmlFor="title" className="block text-sm font-medium text-gray-700">Title</label>
        <input
          type="text"
          id="title"
          value={title}
          onChange={(e) => setTitle(e.target.value)}
          className="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50"
          required
        />
      </div>
      <div>
        <label htmlFor="content" className="block text-sm font-medium text-gray-700">Content</label>
        <textarea
          id="content"
          value={content}
          onChange={(e) => setContent(e.target.value)}
          rows={4}
          className="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50"
          required
        ></textarea>
      </div>
      <button type="submit" className="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600">Create Content</button>
    </form>
  )
}
EOF

# Create src/components/ContentList.tsx
cat > src/components/ContentList.tsx << EOF
export default function ContentList() {
  // This would typically come from your backend
  const contentItems = [
    { id: 1, title: 'First Post', excerpt: 'This is the first post...' },
    { id: 2, title: 'Second Post', excerpt: 'This is the second post...' },
  ]

  return (
    <div className="mt-8">
      <h2 className="text-2xl font-bold mb-4">Existing Content</h2>
      <ul className="space-y-4">
        {contentItems.map((item) => (
          <li key={item.id} className="border p-4 rounded-md">
            <h3 className="text-xl font-semibold">{item.title}</h3>
            <p className="text-gray-600">{item.excerpt}</p>
          </li>
        ))}
      </ul>
    </div>
  )
}
EOF

# Update src/app/content-creator/page.tsx
cat > src/app/content-creator/page.tsx << EOF
import ContentForm from '@/components/ContentForm'
import ContentList from '@/components/ContentList'

export default function ContentCreator() {
  return (
    <div className="p-24">
      <h1 className="text-4xl font-bold mb-8">Content Creator</h1>
      <ContentForm />
      <ContentList />
    </div>
  )
}
EOF

# Update PROJECT_LOG.md
./update_project.sh << EOF
Implemented basic Content Creator functionality:
- Created ContentForm component for adding new content
- Created ContentList component to display existing content
- Updated Content Creator page to include both components
EOF

echo "Content Creator functionality implemented. Please run 'npm run dev' to see the changes."
