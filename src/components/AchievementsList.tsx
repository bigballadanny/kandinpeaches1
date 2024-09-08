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
