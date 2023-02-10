import 'package:bored/food_theme.dart';
import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(const Food());
}
class Food extends StatelessWidget {
  const Food({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = FoodLichTheme.dark();
    return  MaterialApp(
      theme: theme,
      title: "Fooder",
      home: const Home(),
    );
  }
}
