const WebSocket = require('ws');
const ActionExecutor = require('./action_executor');

const wss = new WebSocket.Server({ port: 8080 });

module.exports.WebSocketServer = {
  start: () => {
    wss.on('connection', (ws) => {
      console.log('Mobile app connected');

      ws.on('message', (message) => {
        console.log('Received:', message.toString());
        ActionExecutor.execute(message.toString());
      });

      ws.on('close', () => {
        console.log('Mobile app disconnected');
      });
    });

    console.log('WebSocket server running on ws://localhost:8080');
  }
};
