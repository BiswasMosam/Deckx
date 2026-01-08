import 'package:flutter/material.dart';
import '../services/profile_service.dart';
import '../models/profile_model.dart';
import '../widgets/profile_card.dart';

class ProfileManagerScreen extends StatefulWidget {
  @override
  _ProfileManagerScreenState createState() => _ProfileManagerScreenState();
}

class _ProfileManagerScreenState extends State<ProfileManagerScreen> {
  int selectedIndex = 0;

  void _addProfile() {
    setState(() {
      ProfileService.addProfile(
        ProfileModel(name: 'New Profile', buttons: []),
      );
    });
  }

  void _deleteProfile(int index) {
    setState(() {
      if (ProfileService.profiles.length > 1) {
        ProfileService.removeProfile(index);
        if (selectedIndex >= ProfileService.profiles.length) {
          selectedIndex = 0;
        }
      }
    });
  }

  void _selectProfile(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DeckX Profiles'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: ProfileService.profiles.length,
        itemBuilder: (context, index) {
          final profile = ProfileService.profiles[index];

          return ProfileCard(
            profile: profile,
            isSelected: selectedIndex == index,
            onTap: () => _selectProfile(index),
            onDelete: () => _deleteProfile(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addProfile,
        child: const Icon(Icons.add),
      ),
    );
  }
}
