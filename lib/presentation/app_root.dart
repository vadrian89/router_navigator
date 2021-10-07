import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// For non-freezed version
import 'package:router_navigator/application/router_cubit/router_cubit.dart';
import 'package:router_navigator/presentation/freezed_router/root_freezed_router_parser.dart';
import 'package:router_navigator/presentation/router/root_router_parser.dart';
import 'router/root_router_delegate.dart';
// For freezed version
import 'package:router_navigator/application/freezed_router/freezed_router_cubit.dart';
import 'freezed_router/root_freezed_router_delegate.dart';

class AppRoot extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  // true - use freezed version; false - use non-freezed version
  static const bool _useFreezed = false;

  AppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => FreezedRouterCubit(),
          ),
          BlocProvider(
            create: (context) => RouterCubit(),
          ),
        ],
        child: _useFreezed ? _freezedRouter : _router,
      );

  Widget get _router => BlocBuilder<RouterCubit, RouterState>(
        builder: (context, state) => MaterialApp.router(
          theme: ThemeData.from(
            colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.blue,
            ).copyWith(secondary: Colors.yellow),
          ),
          routerDelegate: RootRouterDelegate(
            navigatorKey,
            context.read<RouterCubit>(),
          ),
          routeInformationParser: const RootRouterParser(),
        ),
      );

  Widget get _freezedRouter => BlocBuilder<FreezedRouterCubit, FreezedRouterState>(
        builder: (context, state) => MaterialApp.router(
          theme: ThemeData.from(
            colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.blue,
            ).copyWith(secondary: Colors.yellow),
          ),
          routerDelegate: RootFreezedRouterDelegate(
            navigatorKey,
            context.read<FreezedRouterCubit>(),
          ),
          routeInformationParser: const FreezedRootRouterParser(),
        ),
      );
}
