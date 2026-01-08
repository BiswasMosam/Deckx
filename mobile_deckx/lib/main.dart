import 'package:flutter/material.dart';
import 'screens/connection_screen.dart';

void main() {
  runApp(DeckXApp());
}

class DeckXApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeckX',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.teal,
        scaffoldBackgroundColor: Colors.black,
        textTheme: ThemeData.dark().textTheme.apply(fontFamily: 'Roboto'),
      ),
      home: ConnectionScreen(),
    );
  }
}