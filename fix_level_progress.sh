#!/bin/bash

# Fix LevelProgress component
cat > src/components/LevelProgress.tsx << EOF
'use client'

import React from 'react';

type LevelProgressProps = {
  level: number;
  experience: number;
  nextLevelExperience: number;
};

function LevelProgress({ level, experience, nextLevelExperience }: LevelProgressProps) {
  const progress = (experience / nextLevelExperience) * 100;

  return (
    <div className="bg-light-bg p-4 rounded-lg shadow-lg">
      <h3 className="text-xl font-retro text-miami-orange mb-2">Level {level}</h3>
      <div className="w-full bg-dark-bg rounded-full h-4 mb-2">
        <div 
          className="bg-gradient-to-r from-miami-pink to-miami-purple h-4 rounded-full" 
          style={{width: `${progress}%`}}
        ></div>
      </div>
      <p className="text-sm text-right">{experience} / {nextLevelExperience} XP</p>
    </div>
  );
}

export default LevelProgress;
EOF

# Update PROJECT_LOG.md
./update_project.sh << EOF
Fixed LevelProgress component:
- Changed to function declaration syntax
- Added 'use client' directive
EOF

echo "LevelProgress component fixed. Please run 'npm run dev' to see the changes."
