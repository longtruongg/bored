import 'package:bored/food_theme.dart';
import 'package:bored/model/model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home.dart';

void main() {
  runApp(Food());
}

class Food extends StatelessWidget {
  const Food({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = FoodLichTheme.dark();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      title: "Fooder",
      home:  MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context)=>TabManager()),
          ChangeNotifierProvider(create: (context)=>GrokingManager()),
        ],
        child: const Home(),
      ),
    );
  }
}
