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

  updateGrokingList(GrokingItem item, int index) {
    _grokingItem[index] = item;
    notifyListeners();
  }

  completeGrokingItem(int index, bool change) {
    final val = _grokingItem[index];
    _grokingItem[index] = val.copyWith(isComplete: change);
    notifyListeners();
  }
}
