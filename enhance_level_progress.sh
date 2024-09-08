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

  return React.createElement('div', { className: "bg-white dark:bg-midnight-blue p-6 rounded-lg shadow-md" },
    React.createElement('h2', { className: "text-2xl font-serif font-bold text-luxury-gold mb-4" }, "Level Progress"),
    React.createElement('p', { className: "text-lg mb-2 text-charcoal dark:text-soft-cream" }, "Level: " + level),
    React.createElement('div', { className: "w-full bg-gray-200 dark:bg-gray-700 rounded-full h-3 mb-2" },
      React.createElement('div', {
        className: "bg-luxury-gold h-3 rounded-full transition-all duration-500 ease-out",
        style: { width: progress + "%" }
      })
    ),
    React.createElement('p', { className: "text-sm text-charcoal dark:text-soft-cream" }, 
      experience + " / " + nextLevelExperience + " XP (" + progress + "%)"
    )
  )
}

export default LevelProgress
EOF

# Update PROJECT_LOG.md
./update_project.sh << EOF
Enhanced LevelProgress component:
- Added dark mode support
- Improved styling with luxury theme colors
- Added percentage display to progress bar
EOF

echo "LevelProgress component enhanced. Please run 'npm run dev' to see the changes."
