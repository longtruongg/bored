import 'package:bored/model/model.dart';
import 'package:flutter/material.dart';

class GrokingItemScreen extends StatefulWidget {
  final Function(GrokingItem) onCreate;
  final Function(GrokingItem) onUpdate;
  final GrokingItem? originalItem;
  final bool isUpdating;

  const GrokingItemScreen(
      {Key? key,
      required this.onCreate,
      required this.onUpdate,
      required this.originalItem})
      : isUpdating = (originalItem != null),
        super(key: key);

  @override
  State<GrokingItemScreen> createState() => _GrokingItemScreenState();
}

class _GrokingItemScreenState extends State<GrokingItemScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
