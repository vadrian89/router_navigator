import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:router_navigator/application/main_navigation/main_navigation_cubit.dart';
import 'package:router_navigator/presentation/main_screen.dart';
import 'package:router_navigator/presentation/second_level_screen.dart';

class MainNavigationDelegate extends StatefulWidget {
  const MainNavigationDelegate({Key? key}) : super(key: key);

  @override
  _MainNavigationDelegateState createState() => _MainNavigationDelegateState();
}

class _MainNavigationDelegateState extends State<MainNavigationDelegate> {
  MainNavigationCubit? _navigationCubit;

  @override
  Widget build(BuildContext context) {
    _navigationCubit = context.watch<MainNavigationCubit>();

    return WillPopScope(
      onWillPop: () async {
        if (_navigationCubit!.state.isRootPage) return true;
        _navigationCubit!.goToPage1();
        return false;
      },
      child: Navigator(
        pages: [
          _materialPage(valueKey: "mainScreen", child: const MainScreen()),
          ..._extraPages,
        ],
        onPopPage: _onPopPageParser,
      ),
    );
  }

  List<Page> get _extraPages =>
      _navigationCubit?.state.when(
        page1: (text) => [
          if (text != null)
            _materialPage(
              valueKey: "page-1-extra",
              child: SecondLevelScreen(text: text),
            ),
        ],
        page2: (text) => [
          if (text != null)
            _materialPage(
              valueKey: "page-2-extra",
              child: SecondLevelScreen(text: text),
            ),
        ],
        page3: (text) => [
          if (text != null)
            _materialPage(
              valueKey: "page-3-extra",
              child: SecondLevelScreen(text: text),
            ),
        ],
        page4: (text) => [
          if (text != null)
            _materialPage(
              valueKey: "page-4-extra",
              child: SecondLevelScreen(text: text),
            ),
        ],
      ) ??
      [];

  bool _onPopPageParser(Route<dynamic> route, dynamic result) {
    if (!route.didPop(result)) return false;
    _navigationCubit?.state.when(
      page1: (_) => _navigationCubit!.goToPage1(),
      page2: (_) => _navigationCubit!.goToPage2(),
      page3: (_) => _navigationCubit!.goToPage3(),
      page4: (_) => _navigationCubit!.goToPage4(),
    );
    return true;
  }

  Page _materialPage({
    required String valueKey,
    required Widget child,
  }) =>
      MaterialPage(
        key: ValueKey<String>(valueKey),
        child: child,
      );
}
