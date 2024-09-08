#!/bin/bash

# Update Layout component
sed -i 's/Synthios Dashboard/Content Analytics Platform/g' src/components/Layout.tsx

# Update metadata in layout.tsx
sed -i 's/Synthios Dashboard/Content Analytics Platform/g' src/app/layout.tsx
sed -i 's/Efficient content management and analytics/Streamlined content management with powerful analytics/g' src/app/layout.tsx

# Update homepage
cat > src/app/page.tsx << EOF
export default function Home() {
  return (
    <div className="space-y-6">
      <h1 className="text-4xl font-bold">Welcome to Your Content Analytics Platform</h1>
      <p className="text-xl">Manage your content and gain valuable insights efficiently.</p>
      <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
        <div className="p-6 bg-white rounded-lg shadow-md">
          <h2 className="text-2xl font-semibold mb-2">Content Management</h2>
          <p>Create, edit, and organize your content with ease.</p>
        </div>
        <div className="p-6 bg-white rounded-lg shadow-md">
          <h2 className="text-2xl font-semibold mb-2">Analytics Dashboard</h2>
          <p>Gain insights into your content's performance and audience engagement.</p>
        </div>
      </div>
    </div>
  )
}
EOF

# Update PROJECT_LOG.md
./update_project.sh << EOF
Updated dashboard branding:
- Renamed dashboard to "Content Analytics Platform"
- Updated metadata and homepage content
EOF

echo "Dashboard name and branding updated. Please run 'npm run dev' to see the changes."
