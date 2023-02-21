import 'package:flutter/material.dart';

class TabManager extends ChangeNotifier {
  int selectTab = 0;

  void goBackTab(index) {
    selectTab = index;
    notifyListeners();
  }

  goToRecipes() {
    selectTab = 1;
    notifyListeners();
  }

}
