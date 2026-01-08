import 'package:flutter/material.dart';
import 'deck_screen.dart';
import '../services/websocket_service.dart';

class ConnectionScreen extends StatefulWidget {
  @override
  _ConnectionScreenState createState() => _ConnectionScreenState();
}

class _ConnectionScreenState extends State<ConnectionScreen> {
  TextEditingController _ipController = TextEditingController();
  bool _connected = false;

  void _connect() async {
    await WebSocketService.connect(_ipController.text);
    setState(() => _connected = true);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => DeckScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Connect to PC')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _ipController,
              decoration: InputDecoration(
                labelText: 'PC IP Address',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _connect,
              child: Text(_connected ? 'Connected' : 'Connect'),
            ),
          ],
        ),
      ),
    );
  }
}
