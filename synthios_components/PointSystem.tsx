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
