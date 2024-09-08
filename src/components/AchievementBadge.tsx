'use client'

import React from 'react';

type AchievementBadgeProps = {
  title: string;
  description: string;
  icon: string;
};

const AchievementBadge: React.FC<AchievementBadgeProps> = ({ title, description, icon }) => {
  return (
    <div className="glass-card p-4 rounded-lg text-center transition-all hover:scale-105">
      <span className="text-4xl mb-2">{icon}</span>
      <h3 className="text-lg font-retro neon-text">{title}</h3>
      <p className="text-sm">{description}</p>
    </div>
  );
};

export default AchievementBadge;
