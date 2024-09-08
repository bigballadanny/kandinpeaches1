#!/bin/bash

# Create UserProfile type
cat > src/types/UserProfile.ts << EOF
export type UserProfile = {
  id: string;
  username: string;
  level: number;
  experience: number;
  creatorPoints: number;
  achievements: string[];
};
EOF

# Create LevelProgress component
cat > src/components/LevelProgress.tsx << EOF
import React from 'react';

type LevelProgressProps = {
  level: number;
  experience: number;
  nextLevelExperience: number;
};

const LevelProgress: React.FC<LevelProgressProps> = ({ level, experience, nextLevelExperience }) => {
  const progress = (experience / nextLevelExperience) * 100;

  return (
    <div className="bg-light-bg p-4 rounded-lg shadow-lg">
      <h3 className="text-xl font-retro text-miami-orange mb-2">Level {level}</h3>
      <div className="w-full bg-dark-bg rounded-full h-4 mb-2">
        <div 
          className="bg-gradient-to-r from-miami-pink to-miami-purple h-4 rounded-full" 
          style={{width: `${progress}%`}}
        ></div>
      </div>
      <p className="text-sm text-right">{experience} / {nextLevelExperience} XP</p>
    </div>
  );
};

export default LevelProgress;
EOF

# Create AchievementsList component
cat > src/components/AchievementsList.tsx << EOF
import React from 'react';

type Achievement = {
  id: string;
  title: string;
  description: string;
  icon: string;
};

type AchievementsListProps = {
  achievements: Achievement[];
};

const AchievementsList: React.FC<AchievementsListProps> = ({ achievements }) => {
  return (
    <div className="bg-light-bg p-4 rounded-lg shadow-lg">
      <h3 className="text-xl font-retro text-miami-blue mb-4">Achievements</h3>
      <div className="grid grid-cols-2 gap-4">
        {achievements.map((achievement) => (
          <div key={achievement.id} className="bg-dark-bg p-2 rounded flex items-center">
            <span className="text-2xl mr-2">{achievement.icon}</span>
            <div>
              <h4 className="font-retro text-miami-pink">{achievement.title}</h4>
              <p className="text-xs">{achievement.description}</p>
            </div>
          </div>
        ))}
      </div>
    </div>
  );
};

export default AchievementsList;
EOF

# Update homepage to include gamification elements
cat > src/app/page.tsx << EOF
import Link from 'next/link'
import ChallengeCard from '../components/ChallengeCard'
import TelegramBroadcast from '../components/TelegramBroadcast'
import LevelProgress from '../components/LevelProgress'
import AchievementsList from '../components/AchievementsList'
import { Challenge } from '../types/Challenge'
import { UserProfile } from '../types/UserProfile'

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

  // ... (keep existing challenge and handler logic)

  return (
    <div className="space-y-8">
      <h1 className="text-4xl font-retro text-miami-pink">Dashboard</h1>
      
      <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
        <LevelProgress level={user.level} experience={user.experience} nextLevelExperience={5000} />
        <div className="bg-light-bg p-4 rounded-lg shadow-lg">
          <h3 className="text-xl font-retro text-miami-orange mb-2">Creator Points</h3>
          <p className="text-4xl font-retro text-miami-blue">{user.creatorPoints}</p>
        </div>
      </div>

      <AchievementsList achievements={achievements} />
      
      <TelegramBroadcast 
        channelUrl="https://t.me/your_channel" 
        nextSessionTime={new Date("2023-06-15T18:00:00")} 
      />

      {/* ... (keep existing Challenges section) */}
    </div>
  )
}
EOF

# Update PROJECT_LOG.md
./update_project.sh << EOF
Implemented gamification features:
- Created UserProfile type
- Added LevelProgress and AchievementsList components
- Updated homepage to display user level, experience, creator points, and achievements
EOF

echo "Gamification features implemented. Please run 'npm run dev' to see the changes."
