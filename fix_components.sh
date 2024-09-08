#!/bin/bash

# Fix LevelProgress component
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

  return React.createElement('div', { className: "bg-white dark:bg-midnight-blue p-6 rounded-lg shadow-md border-2 border-miami-blue" },
    React.createElement('h2', { className: "text-2xl font-serif font-bold text-miami-pink mb-4" }, "Level Progress"),
    React.createElement('p', { className: "text-lg mb-2 text-charcoal dark:text-soft-cream" }, `Level ${level}`),
    React.createElement('div', { className: "w-full bg-gray-200 dark:bg-gray-700 rounded-full h-4 mb-2" },
      React.createElement('div', {
        className: "bg-miami-blue h-4 rounded-full transition-all duration-500 ease-out",
        style: { width: `${progress}%` }
      })
    ),
    React.createElement('p', { className: "text-sm text-charcoal dark:text-soft-cream" },
      `${experience} / ${nextLevelExperience} XP (${progress}%)`
    )
  )
}

export default LevelProgress
EOF

# Fix PointSystem component
cat > src/components/PointSystem.tsx << EOF
'use client'

import React from 'react'

interface PointSystemProps {
  points: number;
}

const PointSystem: React.FC<PointSystemProps> = ({ points }) => {
  return React.createElement('div', { className: "bg-white dark:bg-midnight-blue p-6 rounded-lg shadow-md border-2 border-miami-yellow" },
    React.createElement('h2', { className: "text-2xl font-serif font-bold text-miami-pink mb-4" }, "Creator Points"),
    React.createElement('p', { className: "text-4xl font-bold text-miami-yellow" }, points.toLocaleString()),
    React.createElement('p', { className: "text-sm text-charcoal dark:text-soft-cream mt-2" }, "Keep creating to earn more points!")
  )
}

export default PointSystem
EOF

# Update PROJECT_LOG.md
./update_project.sh << EOF
Fixed LevelProgress and PointSystem components:
- Replaced JSX syntax with React.createElement
- Maintained Miami-inspired styling
EOF

echo "Components fixed. Please run 'npm run dev' to see the changes."
