const express = require('express');
const next = require('next');
const { handleCommand } = require('./src/lib/hooks/useTelegramBot');
const { TELEGRAM_BOT_TOKEN } = require('./src/lib/firebase/firebase');
const fs = require('fs');

const dev = process.env.NODE_ENV !== 'production';
const app = next({ dev });
const handle = app.getRequestHandler();

app.prepare().then(() => {
  const server = express();

  server.use(express.json());

  server.post('/api/telegram', async (req, res) => {
    const update = req.body;
    console.log('Received Telegram update:', JSON.stringify(update, null, 2));

    if (update.message && update.message.text) {
      const { chat: { id: chatId }, text: command } = update.message;
      try {
        const response = await handleCommand(chatId.toString(), command);
        console.log('Bot response:', response);

        // Send the response back to Telegram
        await fetch(`https://api.telegram.org/bot${TELEGRAM_BOT_TOKEN}/sendMessage`, {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({
            chat_id: chatId,
            text: response,
          }),
        });
      } catch (error) {
        console.error('Error handling command:', error);
      }
    }

    res.status(200).json({ ok: true });
  });

  server.all('*', (req, res) => {
    return handle(req, res);
  });

  server.get('/api/logs', (req, res) => {
    try {
      const logs = fs.readFileSync('bot-test.log', 'utf8');
      res.send(logs);
    } catch (error) {
      res.status(500).send('Error reading logs');
    }
  });

  const port = process.env.PORT || 3000;
  server.listen(port, (err) => {
    if (err) throw err;
    console.log(`> Ready on http://localhost:${port}`);
  });
});

// Add this line at the end of the file
console.log('Server script loaded');