#!/bin/bash

# Create simplified LevelProgress component for Synthios
cat > synthios_components/LevelProgress.tsx << EOF
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
          style={{ width: `${progress}%` }}
        ></div>
      </div>
      <p className="mt-2 text-sm">{experience} / {nextLevelExperience} XP</p>
    </div>
  )
}

export default LevelProgress
EOF

# Create simplified PointSystem component for Synthios
cat > synthios_components/PointSystem.tsx << EOF
import React from 'react'

interface PointSystemProps {
  points: number;
}

const PointSystem: React.FC<PointSystemProps> = ({ points }) => {
  return (
    <div className="bg-white p-4 rounded-lg shadow-md">
      <h2 className="text-xl font-bold mb-2">Creator Points</h2>
      <p className="text-2xl font-bold">{points.toLocaleString()}</p>
    </div>
  )
}

export default PointSystem
EOF

# Update PROJECT_LOG.md
./update_project.sh << EOF
Created simplified components for Synthios:
- LevelProgress component
- PointSystem component
EOF

echo "Simplified components for Synthios created in the synthios_components directory."
