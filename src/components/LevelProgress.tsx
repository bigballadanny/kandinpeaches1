'use client'

import React from 'react'

interface LevelProgressProps {
  level: number;
  experience: number;
  nextLevelExperience: number;
}

const LevelProgress: React.FC<LevelProgressProps> = ({ level, experience, nextLevelExperience }) => {
  const progress = (experience / nextLevelExperience) * 100

  return React.createElement('div', { className: "bg-white dark:bg-midnight-blue p-4 rounded-lg shadow-md" },
    React.createElement('h2', { className: "text-2xl font-serif font-bold text-luxury-gold mb-2" }, "Level Progress"),
    React.createElement('p', { className: "text-lg mb-2" }, ),
    React.createElement('div', { className: "w-full bg-gray-200 rounded-full h-2.5 dark:bg-gray-700" },
      React.createElement('div', { className: "bg-luxury-gold h-2.5 rounded-full", style: { width:  } })
    ),
    React.createElement('p', { className: "text-sm mt-2" }, )
  )
}

export default LevelProgress
