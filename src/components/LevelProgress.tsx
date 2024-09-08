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
