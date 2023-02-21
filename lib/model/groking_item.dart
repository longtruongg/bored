import 'dart:ui';

enum Importance { low, medium, height }

class GrokingItem {
  final String id;
  final String name;
  final Importance importance;
  final int quantity;
  final Color color;
  final DateTime timestamp;
  final bool isComplete;

  GrokingItem(
      {required this.id,
      required this.name,
      required this.importance,
      required this.color,
      required this.quantity,
      required this.timestamp,
      this.isComplete = false});

  GrokingItem copyWith(
      {String? id,
      String? name,
      Importance? importance,
      Color? color,
      int? quantity,
      DateTime? timestamp,
      bool? isComplete}) {
    return GrokingItem(
      id: id ?? this.id,
      name: name ?? this.name,
      importance: importance ?? this.importance,
      color: color ?? this.color,
      quantity: quantity ?? this.quantity,
      timestamp: timestamp ?? this.timestamp,
      isComplete: isComplete ?? this.isComplete,
    );
  }
}
