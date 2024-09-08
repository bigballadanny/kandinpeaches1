import React, { useState, useEffect } from 'react';

type TelegramBroadcastProps = {
  channelUrl: string;
  nextSessionTime: Date;
};

const TelegramBroadcast: React.FC<TelegramBroadcastProps> = ({ channelUrl, nextSessionTime }) => {
  const [timeUntilSession, setTimeUntilSession] = useState('');

  useEffect(() => {
    const timer = setInterval(() => {
      const now = new Date();
      const difference = nextSessionTime.getTime() - now.getTime();
      
      if (difference > 0) {
        const hours = Math.floor(difference / (1000 * 60 * 60));
        const minutes = Math.floor((difference % (1000 * 60 * 60)) / (1000 * 60));
        const seconds = Math.floor((difference % (1000 * 60)) / 1000);
        
        setTimeUntilSession();
      } else {
        setTimeUntilSession('Live Now!');
      }
    }, 1000);

    return () => clearInterval(timer);
  }, [nextSessionTime]);

  return (
    <div className="bg-light-bg p-6 rounded-lg shadow-lg">
      <h2 className="text-2xl font-retro mb-4 text-miami-blue">Yoga & Meditation</h2>
      <p className="mb-4">Next session: {timeUntilSession}</p>
      <a 
        href={channelUrl} 
        target="_blank" 
        rel="noopener noreferrer"
        className="px-4 py-2 bg-miami-purple text-white rounded hover:bg-miami-pink transition-colors"
      >
        Join Telegram Channel
      </a>
    </div>
  );
};

export default TelegramBroadcast;
