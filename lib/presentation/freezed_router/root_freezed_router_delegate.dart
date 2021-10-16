import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:router_navigator/application/freezed_router/freezed_router_cubit.dart';
import 'package:router_navigator/presentation/second_level_screen.dart';

import 'main_screen.dart';

class RootFreezedRouterDelegate extends RouterDelegate<FreezedRouterState> {
  final GlobalKey<NavigatorState> _navigatorKey;
  final FreezedRouterCubit _routerCubit;

  RootFreezedRouterDelegate(GlobalKey<NavigatorState> navigatorKey, FreezedRouterCubit routerCubit)
      : _navigatorKey = navigatorKey,
        _routerCubit = routerCubit;

  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  @override
  FreezedRouterState get currentConfiguration => _routerCubit.state;

  @override
  Widget build(BuildContext context) => Navigator(
        key: navigatorKey,
        pages: List.from([
          _materialPage(valueKey: "mainScreen", child: const MainScreen()),
          ..._extraPages,
        ]),
        onPopPage: _onPopPageParser,
      );

  @override
  Future<void> setNewRoutePath(FreezedRouterState configuration) async =>
      _routerCubit.setNewRoutePath(configuration);

  bool _onPopPageParser(Route<dynamic> route, dynamic result) {
    if (!route.didPop(result)) return false;
    popRoute();
    return true;
  }

  @override
  Future<bool> popRoute() async {
    if (_extraPages.isNotEmpty) {
      await _routerCubit.popExtra();
      return true;
    }
    if (!_routerCubit.state.isRootPage) {
      await _routerCubit.goToPage1();
      return true;
    }
    return await _confirmAppExit();
  }

  List<Page> get _extraPages => _routerCubit.state.when(
        page1: (extraPageContent) => [
          if (extraPageContent?.isNotEmpty ?? false)
            _materialPage(
              valueKey: "page-1-extra",
              child: SecondLevelScreen(text: extraPageContent!),
            )
        ],
        page2: (extraPageContent) => [
          if (extraPageContent?.isNotEmpty ?? false)
            _materialPage(
              valueKey: "page-2-extra",
              child: SecondLevelScreen(text: extraPageContent!),
            )
        ],
        page3: (extraPageContent) => [
          if (extraPageContent?.isNotEmpty ?? false)
            _materialPage(
              valueKey: "page-3-extra",
              child: SecondLevelScreen(text: extraPageContent!),
            )
        ],
        page4: (extraPageContent) => [
          if (extraPageContent?.isNotEmpty ?? false)
            _materialPage(
              valueKey: "page-4-extra",
              child: SecondLevelScreen(text: extraPageContent!),
            )
        ],
      );

  Future<bool> _confirmAppExit() async =>
      await showDialog<bool>(
        context: navigatorKey.currentContext!,
        builder: (context) => AlertDialog(
          title: const Text("Exit App"),
          content: const Text("Are you sure you want to exit the app?"),
          actions: [
            TextButton(
              child: const Text("Cancel"),
              onPressed: () => Navigator.pop(context, true),
            ),
            TextButton(
              child: const Text("Confirm"),
              onPressed: () => Navigator.pop(context, false),
            ),
          ],
        ),
      ) ??
      true;

  Page _materialPage({
    required String valueKey,
    required Widget child,
  }) =>
      MaterialPage(
        key: ValueKey<String>(valueKey),
        child: child,
      );

  //It's not needed for bloc/cubit
  @override
  void addListener(VoidCallback listener) {}

  //It's not needed for bloc/cubit
  @override
  void removeListener(VoidCallback listener) {}
}
