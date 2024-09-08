#!/bin/bash

# Enhance LevelProgress component
cat > src/components/LevelProgress.tsx << EOF
'use client'

import React from 'react'

interface LevelProgressProps {
  level: number;
  experience: number;
  nextLevelExperience: number;
}

const LevelProgress: React.FC<LevelProgressProps> = ({ level, experience, nextLevelExperience }) => {
  const progress = Math.round((experience / nextLevelExperience) * 100)

  return (
    <div className="bg-white dark:bg-midnight-blue p-6 rounded-lg shadow-md border-2 border-miami-blue">
      <h2 className="text-2xl font-serif font-bold text-miami-pink mb-4">Level Progress</h2>
      <p className="text-lg mb-2 text-charcoal dark:text-soft-cream">Level {level}</p>
      <div className="w-full bg-gray-200 dark:bg-gray-700 rounded-full h-4 mb-2">
        <div
          className="bg-miami-blue h-4 rounded-full transition-all duration-500 ease-out"
          style={{ width: `${progress}%` }}
        ></div>
      </div>
      <p className="text-sm text-charcoal dark:text-soft-cream">
        {experience} / {nextLevelExperience} XP ({progress}%)
      </p>
    </div>
  )
}

export default LevelProgress
EOF

# Enhance PointSystem component
cat > src/components/PointSystem.tsx << EOF
'use client'

import React from 'react'

interface PointSystemProps {
  points: number;
}

const PointSystem: React.FC<PointSystemProps> = ({ points }) => {
  return (
    <div className="bg-white dark:bg-midnight-blue p-6 rounded-lg shadow-md border-2 border-miami-yellow">
      <h2 className="text-2xl font-serif font-bold text-miami-pink mb-4">Creator Points</h2>
      <p className="text-4xl font-bold text-miami-yellow">{points.toLocaleString()}</p>
      <p className="text-sm text-charcoal dark:text-soft-cream mt-2">Keep creating to earn more points!</p>
    </div>
  )
}

export default PointSystem
EOF

# Update PROJECT_LOG.md
./update_project.sh << EOF
Enhanced LevelProgress and PointSystem components:
- Added Miami-inspired styling
- Improved responsiveness and visual appeal
EOF

echo "Components enhanced. Please run 'npm run dev' to see the changes."
