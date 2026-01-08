const { WebSocketServer } = require('./src/websocket_server');

console.log('Starting DeckX Desktop Companion...');
WebSocketServer.start();
