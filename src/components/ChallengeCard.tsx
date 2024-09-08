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
