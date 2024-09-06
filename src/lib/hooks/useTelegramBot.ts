import { useState, useCallback } from 'react';
import { getUserData, updateUserData, getContent, addDocument } from '../firebase/firebaseUtils';

export async function handleCommand(userId: string, command: string) {
  console.log(`Attempting to handle command for user ${userId}: ${command}`);
  try {
    const userData = await getUserData(userId);
    console.log('User data:', userData);
    
    if (!userData) {
      console.log(`User not found: ${userId}`);
      return "Welcome! It looks like you're new here. Please use /start to begin.";
    }

    console.log(`Handling command for user ${userId}: ${command}`);

    const [cmd, ...args] = command.split(' ');

    switch (cmd.toLowerCase()) {
      case '/start':
        return "Welcome to our content creator bot! How can I assist you today?";
      case '/help':
        return "Available commands:\n/start - Start the bot\n/subscribe - View subscription options\n/content - View available content\n/chat - Start a chat session";
      case '/subscribe':
        // TODO: Implement subscription logic
        return "Subscription options coming soon!";
      case '/content':
        const content = await getContent('general');
        return `Available content:\n${content.map((c: any) => c.title).join('\n')}`;
      case '/chat':
        // TODO: Implement chat session logic
        return "Chat sessions coming soon!";
      default:
        return await handleChat(userId, command);
    }
  } catch (err) {
    console.error('Error in handleCommand:', err);
    return "An error occurred. Please try again later.";
  }
}

async function handleChat(userId: string, message: string) {
  console.log(`Handling chat message for user ${userId}: ${message}`);
  // TODO: Implement AI chat logic
  await addDocument('messages', { userId, message, timestamp: new Date() });
  return "Thanks for your message! I'll get back to you soon.";
}

export function useTelegramBot() {
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const handleCommandWrapper = useCallback(async (userId: string, command: string) => {
    setLoading(true);
    setError(null);
    try {
      const response = await handleCommand(userId, command);
      return response;
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err));
      throw err;
    } finally {
      setLoading(false);
    }
  }, []);

  return { handleCommand: handleCommandWrapper, loading, error };
}