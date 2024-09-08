#!/bin/bash

# Simplify LevelProgress component
cat > src/components/LevelProgress.tsx << EOF
'use client'

import React from 'react';

type LevelProgressProps = {
  level: number;
  experience: number;
  nextLevelExperience: number;
};

export default function LevelProgress({ level, experience, nextLevelExperience }: LevelProgressProps) {
  return (
    <div>
      <h3>Level {level}</h3>
      <p>{experience} / {nextLevelExperience} XP</p>
    </div>
  );
}
EOF

# Update PROJECT_LOG.md
./update_project.sh << EOF
Simplified LevelProgress component:
- Removed complex JSX to isolate the issue
EOF

echo "LevelProgress component simplified. Please run 'npm run dev' to see the changes."
