'use client'

import React from 'react';

type PointSystemProps = {
  points: number;
  level: number;
};

const PointSystem: React.FC<PointSystemProps> = ({ points, level }) => {
  return (
    <div className="glass-card p-4 rounded-lg">
      <h2 className="text-2xl font-retro neon-text mb-2">Creator Stats</h2>
      <p className="text-lg">Points: <span className="font-bold text-miami-pink">{points}</span></p>
      <p className="text-lg">Level: <span className="font-bold text-miami-blue">{level}</span></p>
    </div>
  );
};

export default PointSystem;
