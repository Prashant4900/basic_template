import 'package:basic_template/views/components/icon_widgets.dart';
import 'package:basic_template/views/screens/home_screen.dart';
import 'package:flutter/material.dart';

class MyDashboard extends StatefulWidget {
  const MyDashboard({super.key});

  @override
  State<MyDashboard> createState() => _MyDashboardState();
}

class _MyDashboardState extends State<MyDashboard> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const IndexedStack(
        children: [
          MyHomeScreen(),
          MyHomeScreen(),
          MyHomeScreen(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (value) => setState(() => _currentIndex = value),
        destinations: const [
          NavigationDestination(
            selectedIcon: PrimaryIcon(Icons.dashboard),
            icon: Icon(Icons.dashboard),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: PrimaryIcon(Icons.analytics),
            icon: Icon(Icons.analytics),
            label: 'Analysis',
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
