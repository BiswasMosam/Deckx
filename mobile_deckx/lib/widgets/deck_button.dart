import 'package:flutter/material.dart';
import '../models/button_model.dart';
import '../services/websocket_service.dart';
import 'package:vibration/vibration.dart';

class DeckButton extends StatelessWidget {
  final ButtonModel button;

  DeckButton({required this.button});

  void _sendAction() {
    if (button.multiActions.isNotEmpty) {
      for (var action in button.multiActions) {
        WebSocketService.sendAction(action);
      }
    } else {
      WebSocketService.sendAction(button.action);
    }
    Vibration.vibrate(duration: 50);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _sendAction,
      style: ElevatedButton.styleFrom(
        backgroundColor: button.color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (button.iconPath.isNotEmpty)
            Image.asset(button.iconPath, width: 32, height: 32),
          SizedBox(height: 5),
          Text(button.name, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}