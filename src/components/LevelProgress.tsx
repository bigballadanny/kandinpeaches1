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
    React.createElement('p', { className: "text-lg mb-2 text-charcoal dark:text-soft-cream" }, ),
    React.createElement('div', { className: "w-full bg-gray-200 dark:bg-gray-700 rounded-full h-4 mb-2" },
      React.createElement('div', {
        className: "bg-miami-blue h-4 rounded-full transition-all duration-500 ease-out",
        style: { width:  }
      })
    ),
    React.createElement('p', { className: "text-sm text-charcoal dark:text-soft-cream" },
      
    )
  )
}

export default LevelProgress
