import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:router_navigator/application/main_navigation/main_navigation_cubit.dart';
import 'package:router_navigator/presentation/main_navigation_delegate.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => MainNavigationCubit(),
        child: Builder(
          builder: (context) => MaterialApp(
            theme: ThemeData.from(
              colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.blue,
              ).copyWith(secondary: Colors.yellow),
            ),
            home: const MainNavigationDelegate(),
          ),
        ),
      );
}
