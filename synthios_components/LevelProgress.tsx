import React from 'react'

interface LevelProgressProps {
  level: number;
  experience: number;
  nextLevelExperience: number;
}

const LevelProgress: React.FC<LevelProgressProps> = ({ level, experience, nextLevelExperience }) => {
  const progress = Math.round((experience / nextLevelExperience) * 100)

  return (
    <div className="bg-white p-4 rounded-lg shadow-md">
      <h2 className="text-xl font-bold mb-2">Level Progress</h2>
      <p className="mb-2">Level: {level}</p>
      <div className="w-full bg-gray-200 rounded-full h-2.5">
        <div
          className="bg-blue-600 h-2.5 rounded-full"
          style={{ width:  }}
        ></div>
      </div>
      <p className="mt-2 text-sm">{experience} / {nextLevelExperience} XP</p>
    </div>
  )
}

export default LevelProgress
