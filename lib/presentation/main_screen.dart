import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:router_navigator/application/main_navigation/main_navigation_cubit.dart';
import 'package:router_navigator/presentation/main_screen/main_screen_tab_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin {
  TabController? _tabCtrl;

  List<Tab> get _tabs => [
        const Tab(
          icon: Icon(Icons.home),
          text: "Page 1",
        ),
        const Tab(
          icon: Icon(Icons.access_alarm),
          text: "Page 2",
        ),
        const Tab(
          icon: Icon(Icons.outbond),
          text: "Page 3",
        ),
        const Tab(
          icon: Icon(Icons.run_circle),
          text: "Page 4",
        ),
      ];

  @override
  void initState() {
    super.initState();
    _tabCtrl = TabController(
      initialIndex: _pageIndexFromState(context.read<MainNavigationCubit>().state),
      vsync: this,
      length: _tabs.length,
    );
  }

  @override
  void dispose() {
    _tabCtrl?.dispose();
    super.dispose();
  }

  @override
  Widget build(_) => BlocConsumer<MainNavigationCubit, MainNavigationState>(
        listener: _listener,
        builder: (context, state) => Scaffold(
          body: _body(context),
          bottomNavigationBar: _bottomNavigationBar(context, state),
        ),
      );

  void _listener(BuildContext context, MainNavigationState state) {
    final int pageIndex = _pageIndexFromState(context.read<MainNavigationCubit>().state);
    if (_tabCtrl != null) _tabCtrl?.animateTo(pageIndex, curve: Curves.easeInOut);
  }

  Widget _body(BuildContext context) => TabBarView(
        controller: _tabCtrl,
        physics: const NeverScrollableScrollPhysics(),
        children: _pages(context),
      );

  List<Widget> _pages(BuildContext context) => [
        MainScreenTabPage(
          text: "Page 1",
          onBtnTap: () => context.read<MainNavigationCubit>().goToPage1("Flutter is number 1."),
        ),
        MainScreenTabPage(
          text: "Page 2",
          onBtnTap: () => context.read<MainNavigationCubit>().goToPage2("2 googly eyes"),
        ),
        MainScreenTabPage(
          text: "Page 3",
          onBtnTap: () => context.read<MainNavigationCubit>().goToPage3("Mom's spaghetti at 3."),
        ),
        MainScreenTabPage(
          text: "Page 4",
          onBtnTap: () => context.read<MainNavigationCubit>().goToPage4("Shoot for 4!"),
        ),
      ];

  Widget _bottomNavigationBar(
    BuildContext context,
    MainNavigationState state,
  ) =>
      Container(
        color: Colors.green[500],
        child: TabBar(
          controller: _tabCtrl,
          onTap: (index) {
            switch (index) {
              case 1:
                context.read<MainNavigationCubit>().goToPage2();
                break;
              case 2:
                context.read<MainNavigationCubit>().goToPage3();
                break;
              case 3:
                context.read<MainNavigationCubit>().goToPage4();
                break;
              default:
                context.read<MainNavigationCubit>().goToPage1();
                break;
            }
          },
          tabs: _tabs,
        ),
      );

  int _pageIndexFromState(MainNavigationState state) => state.maybeWhen(
        orElse: () => 0,
        page2: (_) => 1,
        page3: (_) => 2,
        page4: (_) => 3,
      );
}
