'use client'

import React from 'react'

export default function LevelProgress({ level, experience, nextLevelExperience }: { level: number; experience: number; nextLevelExperience: number }) {
  const progress = (experience / nextLevelExperience) * 100

  return (
    <div className="bg-white dark:bg-midnight-blue p-4 rounded-lg shadow-md">
      <h2 className="text-2xl font-serif font-bold text-luxury-gold mb-2">Level Progress</h2>
      <p className="text-lg mb-2">Level {level}</p>
      <div className="w-full bg-gray-200 rounded-full h-2.5 dark:bg-gray-700">
        <div className="bg-luxury-gold h-2.5 rounded-full" style={{ width:  }}></div>
      </div>
      <p className="text-sm mt-2">{experience} / {nextLevelExperience} XP</p>
    </div>
  )
}
