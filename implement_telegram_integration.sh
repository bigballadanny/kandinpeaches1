#!/bin/bash

# Create TelegramBroadcast component
cat > src/components/TelegramBroadcast.tsx << EOF
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

# Update homepage to include TelegramBroadcast
sed -i '/Creator Challenges/i      <TelegramBroadcast         channelUrl="https://t.me/your_channel"         nextSessionTime={new Date("2023-06-15T18:00:00")}       />' src/app/page.tsx

# Add import for TelegramBroadcast at the top of page.tsx
sed -i '1iimport TelegramBroadcast from "../components/TelegramBroadcast"' src/app/page.tsx

# Update PROJECT_LOG.md
./update_project.sh << EOF
Implemented Telegram Broadcast integration:
- Created TelegramBroadcast component with countdown timer
- Added TelegramBroadcast to homepage
EOF

echo "Telegram Broadcast integration implemented. Please run 'npm run dev' to see the changes."
