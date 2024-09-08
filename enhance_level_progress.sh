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
  const progress = (experience / nextLevelExperience) * 100

  return (
    <div className="bg-white dark:bg-midnight-blue p-4 rounded-lg shadow-md">
      <h2 className="text-2xl font-serif font-bold text-luxury-gold mb-2">Level Progress</h2>
      <p className="text-lg mb-2">Level {level}</p>
      <div className="w-full bg-gray-200 rounded-full h-2.5 dark:bg-gray-700">
        <div 
          className="bg-luxury-gold h-2.5 rounded-full" 
          style={{ width: `${progress}%` }}
        ></div>
      </div>
      <p className="text-sm mt-2">{experience} / {nextLevelExperience} XP</p>
    </div>
  )
}

export default LevelProgress
EOF

# Update PROJECT_LOG.md
./update_project.sh << EOF
Enhanced LevelProgress component:
- Added basic styling
- Implemented progress bar
EOF

echo "LevelProgress component enhanced. Please run 'npm run dev' to see the changes."
