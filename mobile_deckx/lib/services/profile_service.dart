import '../models/profile_model.dart';
import '../models/button_model.dart';

class ProfileService {
  static List<ProfileModel> profiles = [
    ProfileModel(name: 'Default', buttons: [
      ButtonModel(name: 'Open Notepad', action: 'action1'),
      ButtonModel(name: 'Copy', action: 'action2'),
      ButtonModel(name: 'Paste', action: 'action3'),
    ]),
    ProfileModel(name: 'Gaming', buttons: [
      ButtonModel(name: 'Mute Mic', action: 'mute'),
      ButtonModel(name: 'Switch Scene', action: 'scene1'),
    ]),
  ];

  static ProfileModel getProfile(int index) => profiles[index];

  static void addProfile(ProfileModel profile) {
    profiles.add(profile);
  }

  static void removeProfile(int index) {
    profiles.removeAt(index);
  }
}