import 'dart:async';

import 'package:flutter/material.dart';

class FoodTab {
  static const int explore = 1;

  static const int recipes = 2;

  static const int toBuy = 3;
}

class AppStateManager extends ChangeNotifier {
  bool _initialized = false;
  bool _isLogIn = false;
  bool _onboarding = false;
  int _selectTab = FoodTab.explore;

  bool get initiaLized => _initialized;

  bool get isLogin => _isLogIn;

  bool get onBoarding => _onboarding;

  int get selectedTab => _selectTab;

  initialApp() {
    Timer(const Duration(milliseconds: 2000), () {
      _initialized = true;
      notifyListeners();
    });
  }

  login(String username, String password) {
    _isLogIn = true;
    notifyListeners();
  }

  onCompleteOnboarding() {
    _onboarding = true;
    notifyListeners();
  }

  goIndexTab(int index) {
    _selectTab = index;
    notifyListeners();
  }

  goToRecipes() {
    _selectTab = FoodTab.recipes;
    notifyListeners();
  }

  logOut() {
    _isLogIn = false;
    _onboarding = false;
    _initialized = false;
    _selectTab = 0;
    initialApp();
    notifyListeners();
  }
}
