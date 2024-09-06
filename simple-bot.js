const fs = require('fs');

const logFile = 'simple-bot-output.log';

function log(message) {
  const timestamp = new Date().toISOString();
  const logMessage = `${timestamp}: ${message}\n`;
  fs.appendFileSync(logFile, logMessage);
  console.log(message);
}

async function handleCommand(userId, command) {
  log(`Handling command for user ${userId}: ${command}`);

  switch (command.toLowerCase()) {
    case '/start':
      return "Welcome to our content creator bot! How can I assist you today?";
    case '/help':
      return "Available commands:\n/start - Start the bot\n/subscribe - View subscription options\n/content - View available content\n/chat - Start a chat session";
    case '/subscribe':
      return "Subscription options coming soon!";
    case '/content':
      return "Available content:\nVideo 1\nVideo 2\nPicture Pack 1";
    case '/chat':
      return "Chat sessions coming soon!";
    default:
      return `You said: ${command}. How can I help you with that?`;
  }
}

async function testBot() {
  fs.writeFileSync(logFile, ''); // Clear previous log file

  log('Starting bot test...');

  const testUserId = 'test-user-123';
  const testCommands = [
    '/start',
    '/help',
    '/subscribe',
    '/content',
    '/chat',
    'Hello, bot!'
  ];

  for (const command of testCommands) {
    log(`Testing command: ${command}`);
    try {
      const response = await handleCommand(testUserId, command);
      log(`Bot response: ${response}`);
    } catch (error) {
      log(`Error handling command: ${error}`);
    }
    log('---');
  }

  log('Bot test completed');
  log('Test results have been written to simple-bot-output.log');
}

testBot();