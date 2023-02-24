import 'package:flutter/material.dart';

import 'model.dart';

class ProfileManager extends ChangeNotifier {
  bool _darkMode = false;
  bool _tapOn = false;
  bool _didSelectUser = false;

  User get GetUser => User(
        firstName: "Hi",
        lastName: "He",
        profileImageUrl: "assets/profile/person_stef.jpeg",
        points: 100,
        darkMode: _darkMode,
        role: '',
      );

  bool get didSelectUser => _didSelectUser;

  bool get darkMode => _darkMode;

  bool get didTapOn => _tapOn;

  set darkMode(bool dark) {
    _darkMode = dark;
    notifyListeners();
  }

  tapOn(bool selected) {
    _tapOn = selected;
    notifyListeners();
  }

  tapOnProfile(bool selected) {
    _didSelectUser = selected;
    notifyListeners();
  }
}
