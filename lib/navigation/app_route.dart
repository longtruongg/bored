import 'package:flutter/material.dart';

import '../model/model.dart';

class AppRouter extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  @override
  // TODO: implement navigatorKey
  GlobalKey<NavigatorState>? get navigatorKey => GlobalKey<NavigatorState>();

  final AppStateManager appStateManager;
  final GrokingManager grokingManager;
  final ProfileManager profileManager;

  AppRouter(this.appStateManager, this.grokingManager, this.profileManager);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [],
      onPopPage: _handlePopPage,
    );
  }

  bool _handlePopPage(Route<dynamic> route, result) {
    if (!route.didPop(result)) {
      return false;
    }
    return true;
  }

  @override
  Future<void> setNewRoutePath(configuration) {
    // TODO: implement setNewRoutePath
    throw UnimplementedError();
  }

  @override
  void dispose() {
    super.dispose();
    appStateManager.removeListener(notifyListeners);
    grokingManager.removeListener(notifyListeners);
    profileManager.removeListener(notifyListeners);
  }
}
