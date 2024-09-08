'use client'

import React from 'react'

interface LevelProgressProps {
  level: number;
  experience: number;
  nextLevelExperience: number;
}

const LevelProgress: React.FC<LevelProgressProps> = ({ level, experience, nextLevelExperience }) => {
  const progress = Math.round((experience / nextLevelExperience) * 100)

  return React.createElement('div', { className: "bg-white p-4 rounded-lg shadow-md" },
    React.createElement('h2', { className: "text-2xl font-bold mb-2" }, "Level Progress"),
    React.createElement('p', { className: "text-lg mb-2" }, "Level: " + level),
    React.createElement('p', { className: "text-sm" }, "Experience: " + experience + " / " + nextLevelExperience),
    React.createElement('div', { className: "w-full bg-gray-200 rounded-full h-2.5" },
      React.createElement('div', {
        className: "bg-blue-600 h-2.5 rounded-full",
        style: { width: progress + "%" }
      })
    )
  )
}

export default LevelProgress
