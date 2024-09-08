#!/bin/bash

# Enhance Home page
cat > src/app/page.tsx << EOF
import dynamic from 'next/dynamic'

const PointSystem = dynamic(() => import('../components/PointSystem'), { ssr: false })
const LevelProgress = dynamic(() => import('../components/LevelProgress'), { ssr: false })
const AchievementBadge = dynamic(() => import('../components/AchievementBadge'), { ssr: false })

export default function Home() {
  const user = {
    creatorPoints: 1200,
    level: 7,
    experience: 3500,
  }

  const achievements = [
    { id: 'first_post', title: 'First Post', description: 'Published your first content', icon: '🎉' },
    { id: 'challenge_complete', title: 'Challenge Accepted', description: 'Completed your first challenge', icon: '🏆' },
    { id: 'follower_milestone', title: 'Rising Star', description: 'Reached 1000 followers', icon: '⭐' },
  ]

  return (
    <div className="space-y-8">
      <h1 className="text-4xl font-serif font-bold text-luxury-gold">Creator Dashboard</h1>
      
      <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
        <PointSystem points={user.creatorPoints} level={user.level} />
        <LevelProgress level={user.level} experience={user.experience} nextLevelExperience={5000} />
      </div>

      <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
        {achievements.map((achievement) => (
          <AchievementBadge key={achievement.id} {...achievement} />
        ))}
      </div>
    </div>
  )
}
EOF

# Update PROJECT_LOG.md
./update_project.sh << EOF
Enhanced Home page:
- Added PointSystem, LevelProgress, and AchievementBadge components
- Implemented basic layout for creator dashboard
EOF

echo "Home page enhanced. Please run 'npm run dev' to see the changes."
