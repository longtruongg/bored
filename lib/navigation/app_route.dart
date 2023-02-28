import 'package:bored/home.dart';
import 'package:bored/screens/login_screen.dart';
import 'package:bored/screens/screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../model/model.dart';

class AppRouter {
  final AppStateManager appStateManager;
  final ProfileManager profileManager;
  final GrokingManager grokingManager;

  AppRouter(this.appStateManager, this.profileManager, this.grokingManager);

  late final router = GoRouter(
      debugLogDiagnostics: true,
      refreshListenable: appStateManager,
      initialLocation: '/login',
      routes: [
        GoRoute(
          name: 'login',
          path: '/login',
          builder: ((context, state) => const LoginScreen()),
        ),
        GoRoute(
          name: 'onboarding',
          path: '/onboarding',
          builder: ((context, state) => const OnBoardingScreen()),
        ),
        GoRoute(
            name: 'home',
            path: '/:tab',
            builder: (context, state) {
              final tab = int.tryParse(state.params['tab'] ?? '') ?? 0;
              return Home(key: state.pageKey, currentTab: tab);
            },
            routes: [
              GoRoute(
                name: 'item',
                path: 'item/:id',
                builder: (context, state) {
                  final itemId = state.params['id'] ?? '';
                  final item = grokingManager.getItemId(itemId);
                  return GrokingItemScreen(
                    originalItem: item,
                    onCreate: (item) {
                      grokingManager.addItem(item);
                    },
                    onUpdate: (item) {
                      grokingManager.updateGrokingList(item);
                    },
                  );
                },
              ),
              GoRoute(
                  name: "profile",
                  path: "profile",
                  builder: (context, state) {
                    final tab = int.tryParse(state.params['tab'] ?? '') ?? 0;
                    return ProfileScreen(
                        user: profileManager.GetUser, currentTab: tab);
                  },
                  routes: [
                    GoRoute(
                      name: 'rw',
                      path: "rw",
                      builder: (context, state) => WebviewScreen(),
                    )
                  ])
            ]),
      ],
      redirect: (context, state) {
        final loggedIn = appStateManager.isLogin;
        final loggingIn = state.subloc == '/login';
        if (!loggedIn) return loggingIn ? null : "/login";
        final onBoardingComplete = appStateManager.onBoardingComplete;
        final onBoarding = state.subloc == "/onboarding";
        if (!onBoardingComplete) return onBoarding ? null : "/onboarding";
        if (loggingIn || onBoarding) {
          return '/${FoodTab.explore}';
        }
        return null;
      },
      errorPageBuilder: (context, state) {
        return MaterialPage(
            key: state.pageKey,
            child: Scaffold(
              body: Center(
                child: Text(state.error.toString()),
              ),
            ));
      });
}
