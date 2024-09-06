const fs = require('fs');
const { handleCommand } = require('./src/lib/hooks/useTelegramBot');

const logFile = 'bot-test-output.log';

function log(message) {
  const timestamp = new Date().toISOString();
  const logMessage = `${timestamp}: ${message}\n`;
  fs.appendFileSync(logFile, logMessage);
  console.log(message);
}

async function testBot() {
  // Clear previous log file
  fs.writeFileSync(logFile, '');

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
  log('Test results have been written to bot-test-output.log');
}

testBot();