import 'dart:math';

import 'package:bored/model/groking_item.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class GrokingManager extends ChangeNotifier {
  final _grokingItem = <GrokingItem>[];

  List<GrokingItem> get grokingItem => List.unmodifiable(_grokingItem);

  deleteItem(int index) {
    _grokingItem.removeAt(index);
    notifyListeners();
  }

  addItem(GrokingItem item) {
    _grokingItem.add(item);
    notifyListeners();
  }

  updateGrokingList(GrokingItem item) {
    final itemIndex = _grokingItem.indexWhere((element) => element.id==item.id);
    _grokingItem[itemIndex]=item;
    notifyListeners();
  }

  completeGrokingItem(int index, bool change) {
    final val = _grokingItem[index];
    _grokingItem[index] = val.copyWith(isComplete: change);
    notifyListeners();
  }
  GrokingItem? getItemId(String id){

      final index = _grokingItem.indexWhere((element) => element.id == id);
      if (index == -1) return null;
      return grokingItem[index];
  }
}
