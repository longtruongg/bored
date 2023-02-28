import 'dart:async';

import 'package:bored/model/app_cache.dart';
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
  final _appCache = AppCache();

  bool get initiaLized => _initialized;

  bool get isLogin => _isLogIn;

  bool get onBoardingComplete => _onboarding;

  int get selectedTab => _selectTab;

  Future<void> initialApp() async {
    Timer(const Duration(milliseconds: 2000), () {
      _initialized = true;
      notifyListeners();
    });
    _isLogIn = await _appCache.isUserLoggedIn();
    _onboarding = await _appCache.didCompleteOnboarding();
  }

  login(String username, String password) async {
    _isLogIn = true;
    await _appCache.cacheUser();
    notifyListeners();
  }

  onCompleteOnboarding() {
    _onboarding = true;
    notifyListeners();
  }

  void onboarded() async {
    _onboarding = true;
    await _appCache.completeOnboarding();
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

  logOut() async {
    _isLogIn = false;
    _onboarding = false;
    _initialized = false;
    _selectTab = 0;
    await _appCache.invalidate();
    await initialApp();
    notifyListeners();
  }
}
