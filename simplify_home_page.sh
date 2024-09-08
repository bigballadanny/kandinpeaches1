#!/bin/bash

# Simplify Home page
cat > src/app/page.tsx << EOF
import dynamic from 'next/dynamic'

const LevelProgress = dynamic(() => import('../components/LevelProgress'), { ssr: false })

export default function Home() {
  const user = {
    level: 7,
    experience: 3500,
  }

  return (
    <div className="space-y-8">
      <h1 className="text-4xl font-serif font-bold text-luxury-gold">Creator Dashboard</h1>
      <LevelProgress level={user.level} experience={user.experience} nextLevelExperience={5000} />
    </div>
  )
}
EOF

# Update PROJECT_LOG.md
./update_project.sh << EOF
Simplified Home page:
- Removed PointSystem and AchievementBadge components
- Kept only LevelProgress component for testing
EOF

echo "Home page simplified. Please run 'npm run dev' to see the changes."
