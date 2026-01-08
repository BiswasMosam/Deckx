import 'package:flutter/material.dart';
import '../widgets/deck_button.dart';
import '../services/profile_service.dart';
import '../models/profile_model.dart';

class DeckScreen extends StatefulWidget {
  @override
  _DeckScreenState createState() => _DeckScreenState();
}

class _DeckScreenState extends State<DeckScreen> {
  int _selectedProfileIndex = 0;

  void _switchProfile(int index) {
    setState(() {
      _selectedProfileIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    ProfileModel profile = ProfileService.getProfile(_selectedProfileIndex);

    return Scaffold(
      appBar: AppBar(
        title: Text('DeckX - ${profile.name}'),
        actions: [
          PopupMenuButton<int>(
            onSelected: _switchProfile,
            itemBuilder: (_) => List.generate(
              ProfileService.profiles.length,
              (i) => PopupMenuItem(
                  value: i, child: Text(ProfileService.profiles[i].name)),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children:
              profile.buttons.map((btn) => DeckButton(button: btn)).toList(),
        ),
      ),
    );
  }
}