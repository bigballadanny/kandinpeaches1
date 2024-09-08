#!/bin/bash

# Fix TelegramBroadcast component
cat > src/components/TelegramBroadcast.tsx << EOF
'use client'

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
        
        setTimeUntilSession(`${hours}h ${minutes}m ${seconds}s`);
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
EOF

# Update PROJECT_LOG.md
./update_project.sh << EOF
Fixed TelegramBroadcast component:
- Added 'use client' directive to make it a Client Component
EOF

echo "TelegramBroadcast component fixed. Please run 'npm run dev' to see the changes."
