#!/bin/bash

# Update page.tsx
cat > src/app/page.tsx << EOF
export default function Home() {
  return (
    <main>
      <h1>Hello, Next.js!</h1>
    </main>
  );
}
EOF

# Update globals.css
cat > src/app/globals.css << EOF
@tailwind base;
@tailwind components;
@tailwind utilities;
EOF

# Update tailwind.config.js
cat > tailwind.config.js << EOF
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './src/pages/**/*.{js,ts,jsx,tsx,mdx}',
    './src/components/**/*.{js,ts,jsx,tsx,mdx}',
    './src/app/**/*.{js,ts,jsx,tsx,mdx}',
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}
EOF

# Update layout.tsx
cat > src/app/layout.tsx << EOF
import './globals.css'
import type { Metadata } from 'next'

export const metadata: Metadata = {
  title: 'Next.js App',
  description: 'Created with Next.js',
}

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="en">
      <body>{children}</body>
    </html>
  )
}
EOF

# Update PROJECT_LOG.md
./update_project.sh << EOF
Reset app to minimal working example to troubleshoot rendering issues.
EOF

echo "App reset complete. Please run 'npm run dev' to start the development server and check the changes."
