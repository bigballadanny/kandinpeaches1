'use client'

import React from 'react';

type LevelProgressProps = {
  level: number;
  experience: number;
  nextLevelExperience: number;
};

export default function LevelProgress({ level, experience, nextLevelExperience }: LevelProgressProps) {
  return (
    <div>
      <h3>Level {level}</h3>
      <p>{experience} / {nextLevelExperience} XP</p>
    </div>
  );
}
