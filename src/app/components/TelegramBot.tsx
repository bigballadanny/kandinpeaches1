import React from 'react';

interface TelegramBotProps {
  userId: string;
}

export const TelegramBot: React.FC<TelegramBotProps> = ({ userId }) => {
  return (
    <div>
      <h2>Telegram Bot</h2>
      <p>This is a placeholder for the Telegram Bot component.</p>
      <p>User ID: {userId}</p>
    </div>
  );
};
