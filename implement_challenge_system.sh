#!/bin/bash

# Create Challenge type
cat > src/types/Challenge.ts << EOF
export type Challenge = {
  id: string;
  title: string;
  description: string;
  prompt: string;
  deadline: Date;
  reward: string;
  participants: string[];
  completed: string[];
};
EOF

# Create ChallengeCard component
cat > src/components/ChallengeCard.tsx << EOF
import React from 'react';
import { Challenge } from '../types/Challenge';

type ChallengeCardProps = {
  challenge: Challenge;
  onParticipate: (id: string) => void;
  onComplete: (id: string) => void;
};

const ChallengeCard: React.FC<ChallengeCardProps> = ({ challenge, onParticipate, onComplete }) => {
  return (
    <div className="bg-light-bg p-4 rounded-lg shadow-lg">
      <h3 className="text-xl font-retro text-miami-pink mb-2">{challenge.title}</h3>
      <p className="text-sm mb-2">{challenge.description}</p>
      <p className="text-xs text-miami-orange mb-2">Prompt: {challenge.prompt}</p>
      <p className="text-xs mb-2">Deadline: {challenge.deadline.toLocaleDateString()}</p>
      <p className="text-sm text-miami-blue mb-4">Reward: {challenge.reward}</p>
      <div className="flex justify-between">
        <button 
          onClick={() => onParticipate(challenge.id)}
          className="px-3 py-1 bg-miami-purple text-white rounded hover:bg-miami-pink transition-colors"
        >
          Participate
        </button>
        <button 
          onClick={() => onComplete(challenge.id)}
          className="px-3 py-1 bg-miami-green text-white rounded hover:bg-miami-blue transition-colors"
        >
          Mark Complete
        </button>
      </div>
    </div>
  );
};

export default ChallengeCard;
EOF

# Update homepage to include challenges
cat > src/app/page.tsx << EOF
import Link from 'next/link'
import ChallengeCard from '../components/ChallengeCard'
import { Challenge } from '../types/Challenge'

export default function Home() {
  // Mock challenges data
  const challenges: Challenge[] = [
    {
      id: '1',
      title: 'Neon Dreams',
      description: 'Create a neon-themed video showcasing your best content',
      prompt: 'Use AI to generate neon cityscapes as your video background',
      deadline: new Date('2023-06-30'),
      reward: '500 Creator Points',
      participants: [],
      completed: [],
    },
    // Add more mock challenges here
  ];

  const handleParticipate = (id: string) => {
    console.log('Participated in challenge:', id);
    // Implement participation logic
  };

  const handleComplete = (id: string) => {
    console.log('Completed challenge:', id);
    // Implement completion logic
  };

  return (
    <div className="space-y-8">
      {/* Existing dashboard content */}
      
      <div className="bg-light-bg p-6 rounded-lg shadow-lg">
        <h2 className="text-2xl font-retro mb-4 text-miami-blue">Creator Challenges</h2>
        <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
          {challenges.map((challenge) => (
            <ChallengeCard 
              key={challenge.id}
              challenge={challenge}
              onParticipate={handleParticipate}
              onComplete={handleComplete}
            />
          ))}
        </div>
      </div>
    </div>
  )
}
EOF

# Update PROJECT_LOG.md
./update_project.sh << EOF
Implemented Creator Challenge system:
- Created Challenge type and ChallengeCard component
- Updated homepage to display current challenges
- Added mock data and placeholder functions for challenge participation and completion
EOF

echo "Creator Challenge system implemented. Please run 'npm run dev' to see the changes."
