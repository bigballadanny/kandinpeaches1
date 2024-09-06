'use client';  // Add this line at the top of the file

import React from 'react';

interface TelegramBotProps {
  userId: string;
}

export const TelegramBot: React.FC<TelegramBotProps> = ({ userId }) => {
  return (
    <div>
      <h2>Telegram Bot</h2>
      <p>User ID: {userId}</p>
      {/* Add your Telegram bot implementation here */}
    </div>
  );
};