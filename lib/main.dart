import 'package:bored/food_theme.dart';
import 'package:bored/model/model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home.dart';
import 'navigation/app_route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appStateManager = AppStateManager();
  await appStateManager.initialApp();
  runApp(Food(appStateManager: appStateManager));
}

class Food extends StatefulWidget {
  final AppStateManager appStateManager;

  const Food({Key? key, required this.appStateManager}) : super(key: key);

  @override
  State<Food> createState() => _FoodState();
}

class _FoodState extends State<Food> {
  late final _grokingManager = GrokingManager();
  late final _profileManager = ProfileManager();
  late final _appRouter = AppRouter(
    widget.appStateManager,
    _grokingManager,
    _profileManager,
  );

  @override
  Widget build(BuildContext context) {
    final theme = FoodLichTheme.dark();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      title: "Fooder",
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => widget.appStateManager),
          ChangeNotifierProvider(create: (context) => TabManager()),
          ChangeNotifierProvider(create: (context) => GrokingManager()),
        ],
        child: Consumer<ProfileManager>(
          builder: (context, profileManager, child) {
            ThemeData theme;
            if (profileManager.darkMode) {
              theme = FoodLichTheme.dark();
            } else {
              theme = FoodLichTheme.light();
            }
            final route = _appRouter.router;
            return MaterialApp.router(
              theme: theme,
              title: "Food",
              routerDelegate: router.,
            );
          },
        ),
      ),
    );
  }
}
