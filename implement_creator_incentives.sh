#!/bin/bash

# Create PointSystem component
cat > src/components/PointSystem.tsx << EOF
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
EOF

# Create AchievementBadge component
cat > src/components/AchievementBadge.tsx << EOF
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
EOF

# Update page.tsx to include new components
cat > src/app/page.tsx << EOF
import dynamic from 'next/dynamic'
import { Challenge } from '../types/Challenge'
import { UserProfile } from '../types/UserProfile'

const ChallengeCard = dynamic(() => import('../components/ChallengeCard'), { ssr: false })
const TelegramBroadcast = dynamic(() => import('../components/TelegramBroadcast'), { ssr: false })
const LevelProgress = dynamic(() => import('../components/LevelProgress'), { ssr: false })
const AchievementsList = dynamic(() => import('../components/AchievementsList'), { ssr: false })
const PointSystem = dynamic(() => import('../components/PointSystem'), { ssr: false })
const AchievementBadge = dynamic(() => import('../components/AchievementBadge'), { ssr: false })

export default function Home() {
  // Mock user data
  const user: UserProfile = {
    id: '1',
    username: 'MiamiCreator',
    level: 7,
    experience: 3500,
    creatorPoints: 1200,
    achievements: ['first_post', 'challenge_complete', 'follower_milestone'],
  };

  // Mock achievements data
  const achievements = [
    { id: 'first_post', title: 'First Post', description: 'Published your first content', icon: '🎉' },
    { id: 'challenge_complete', title: 'Challenge Accepted', description: 'Completed your first challenge', icon: '🏆' },
    { id: 'follower_milestone', title: 'Rising Star', description: 'Reached 1000 followers', icon: '⭐' },
  ];

  return (
    <div className="space-y-8">
      <h1 className="text-4xl font-retro neon-text">Creator Dashboard</h1>
      
      <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
        <PointSystem points={user.creatorPoints} level={user.level} />
        <LevelProgress level={user.level} experience={user.experience} nextLevelExperience={5000} />
      </div>

      <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
        {achievements.map((achievement) => (
          <AchievementBadge key={achievement.id} {...achievement} />
        ))}
      </div>
      
      <TelegramBroadcast 
        channelUrl="https://t.me/your_channel" 
        nextSessionTime={new Date("2023-06-15T18:00:00")} 
      />

      {/* Add ChallengeCard component here if needed */}
    </div>
  )
}
EOF

# Update PROJECT_LOG.md
./update_project.sh << EOF
Implemented creator incentives:
- Created PointSystem component to display creator points and level
- Added AchievementBadge component for visual representation of achievements
- Updated homepage to include new components
EOF

echo "Creator incentives implemented. Please run 'npm run dev' to see the changes."
