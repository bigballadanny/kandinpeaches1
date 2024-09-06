'use client';

import React, { useState } from 'react';
import { useAuth } from '@/lib/hooks/useAuth';
import { isFeatureEnabled } from '../lib/utils/featureFlags';

const ContentCreatorApp: React.FC = () => {
  const { user, signIn, signOut } = useAuth();
  const [content, setContent] = useState('');
  const [telegramMessage, setTelegramMessage] = useState('');

  const handleContentChange = (e: React.ChangeEvent<HTMLTextAreaElement>) => {
    setContent(e.target.value);
  };

  const handleTelegramMessageChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    setTelegramMessage(e.target.value);
  };

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    console.log('Content submitted:', content);
    // TODO: Implement content submission logic
  };

  const handleSendTelegramMessage = () => {
    console.log('Telegram message sent:', telegramMessage);
    // TODO: Implement Telegram bot message sending logic
  };

  return (
    <div className="content-creator-app">
      <h1>Content Creator App</h1>
      {user ? (
        <>
          <p>Welcome, {user.displayName || user.email}!</p>
          <form onSubmit={handleSubmit}>
            <textarea
              value={content}
              onChange={handleContentChange}
              placeholder="Enter your content here..."
              rows={5}
            />
            <button type="submit">Submit Content</button>
          </form>
          {isFeatureEnabled('TELEGRAM_BOT') && (
            <div>
              <h2>Telegram Bot</h2>
              <input
                type="text"
                value={telegramMessage}
                onChange={handleTelegramMessageChange}
                placeholder="Enter Telegram message"
              />
              <button onClick={handleSendTelegramMessage}>Send Telegram Message</button>
            </div>
          )}
          <button onClick={signOut}>Sign Out</button>
        </>
      ) : (
        <button onClick={signIn}>Sign In with Google</button>
      )}
    </div>
  );
};

export default ContentCreatorApp;
