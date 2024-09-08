#!/bin/bash

# Simplify LevelProgress component
cat > src/components/LevelProgress.tsx << EOF
'use client'

import React from 'react'

interface LevelProgressProps {
  level: number;
  experience: number;
  nextLevelExperience: number;
}

const LevelProgress: React.FC<LevelProgressProps> = ({ level, experience, nextLevelExperience }) => {
  return (
    <div>
      <h2>Level Progress</h2>
      <p>Level: {level}</p>
      <p>Experience: {experience} / {nextLevelExperience}</p>
    </div>
  )
}

export default LevelProgress
EOF

# Update PROJECT_LOG.md
./update_project.sh << EOF
Simplified LevelProgress component:
- Removed complex styling and calculations
- Used basic JSX syntax
EOF

echo "LevelProgress component simplified. Please run 'npm run dev' to see the changes."
