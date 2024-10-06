import 'package:basic_template/routes/routers.dart';
import 'package:basic_template/views/components/icon_widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyDashboard extends StatefulWidget {
  const MyDashboard({required this.child, super.key});

  final Widget child;

  @override
  State<MyDashboard> createState() => _MyDashboardState();
}

class _MyDashboardState extends State<MyDashboard> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          switch (index) {
            case 0:
              context.go(MyRoutes.home);
            case 1:
              context.go(MyRoutes.setting);
          }
          _currentIndex = index;
        },
        destinations: const [
          NavigationDestination(
            selectedIcon: PrimaryIcon(Icons.dashboard),
            icon: Icon(Icons.dashboard),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: PrimaryIcon(Icons.settings),
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
        ],
      ),
    );
  }
}
