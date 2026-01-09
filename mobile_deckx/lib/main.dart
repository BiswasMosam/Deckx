import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/home/home_screen.dart';

void main() {
  runApp(const DeckXApp());
}

class DeckXApp extends StatelessWidget {
  const DeckXApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeckX',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const HomeScreen(),
    );
  }
}
