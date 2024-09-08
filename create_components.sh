#!/bin/bash

# Create PointSystem component
cat > src/components/PointSystem.tsx << EOF
export default function PointSystem({ points, level }: { points: number; level: number }) {
  return (
    <div className="bg-white dark:bg-midnight-blue p-4 rounded-lg shadow-md">
      <h2 className="text-2xl font-serif font-bold text-luxury-gold mb-2">Creator Stats</h2>
      <p className="text-lg">Points: <span className="font-bold text-luxury-gold">{points}</span></p>
      <p className="text-lg">Level: <span className="font-bold text-luxury-gold">{level}</span></p>
    </div>
  )
}
EOF

# Create LevelProgress component
cat > src/components/LevelProgress.tsx << EOF
export default function LevelProgress({ level, experience, nextLevelExperience }: { level: number; experience: number; nextLevelExperience: number }) {
  const progress = (experience / nextLevelExperience) * 100

  return (
    <div className="bg-white dark:bg-midnight-blue p-4 rounded-lg shadow-md">
      <h2 className="text-2xl font-serif font-bold text-luxury-gold mb-2">Level Progress</h2>
      <p className="text-lg mb-2">Level {level}</p>
      <div className="w-full bg-gray-200 rounded-full h-2.5 dark:bg-gray-700">
        <div className="bg-luxury-gold h-2.5 rounded-full" style={{ width: `${progress}%` }}></div>
      </div>
      <p className="text-sm mt-2">{experience} / {nextLevelExperience} XP</p>
    </div>
  )
}
EOF

# Create AchievementBadge component
cat > src/components/AchievementBadge.tsx << EOF
export default function AchievementBadge({ title, description, icon }: { title: string; description: string; icon: string }) {
  return (
    <div className="bg-white dark:bg-midnight-blue p-4 rounded-lg shadow-md flex items-center space-x-4">
      <div className="text-4xl">{icon}</div>
      <div>
        <h3 className="text-lg font-serif font-bold text-luxury-gold">{title}</h3>
        <p className="text-sm">{description}</p>
      </div>
    </div>
  )
}
EOF

# Update PROJECT_LOG.md
./update_project.sh << EOF
Created components:
- PointSystem: Displays creator points and level
- LevelProgress: Shows progress towards next level
- AchievementBadge: Displays individual achievements
EOF

echo "Components created. Please run 'npm run dev' to see the changes."
