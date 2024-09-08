#!/bin/bash

# Simplify src/app/page.tsx
cat > src/app/page.tsx << EOF
export default function Home() {
  return (
    <main>
      <h1>Hello, Next.js!</h1>
    </main>
  )
}
EOF

# Update PROJECT_LOG.md
./update_project.sh << EOF
Simplified main page for troubleshooting.
EOF

echo "Main page simplified. Please restart the development server with 'npm run dev'."
