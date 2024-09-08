#!/bin/bash

# Simplify page.tsx
cat > src/app/page.tsx << EOF
export default function Home() {
  return (
    <div>
      <h1>Creator Dashboard</h1>
      <p>Welcome to the Miami AI Creator platform!</p>
    </div>
  )
}
EOF

# Update PROJECT_LOG.md
./update_project.sh << EOF
Simplified page.tsx:
- Removed dynamic imports and mock data
- Created a basic home page structure
EOF

echo "page.tsx simplified. Please run 'npm run dev' to see the changes."
