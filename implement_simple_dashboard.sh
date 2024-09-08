#!/bin/bash

# Update src/app/page.tsx
cat > src/app/page.tsx << EOF
import Link from 'next/link'

export default function Home() {
  return (
    <main className="flex min-h-screen flex-col items-center justify-between p-24">
      <h1 className="text-4xl font-bold mb-8">Dashboard</h1>
      <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
        <Link href="/content-creator" className="p-6 bg-white rounded-lg shadow-md hover:shadow-lg transition-shadow">
          <h2 className="text-2xl font-semibold mb-2">Content Creator</h2>
          <p>Create and manage your content</p>
        </Link>
        <Link href="/analytics" className="p-6 bg-white rounded-lg shadow-md hover:shadow-lg transition-shadow">
          <h2 className="text-2xl font-semibold mb-2">Analytics</h2>
          <p>View your content performance</p>
        </Link>
      </div>
    </main>
  )
}
EOF

# Create src/app/content-creator/page.tsx
mkdir -p src/app/content-creator
cat > src/app/content-creator/page.tsx << EOF
export default function ContentCreator() {
  return (
    <div className="p-24">
      <h1 className="text-4xl font-bold mb-8">Content Creator</h1>
      <p>Content creation tools will be implemented here.</p>
    </div>
  )
}
EOF

# Create src/app/analytics/page.tsx
mkdir -p src/app/analytics
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

# Update PROJECT_LOG.md
./update_project.sh << EOF
Implemented simple dashboard layout with links to Content Creator and Analytics pages.
Created placeholder pages for Content Creator and Analytics.
EOF

echo "Simple dashboard layout implemented. Please run 'npm run dev' to see the changes."
