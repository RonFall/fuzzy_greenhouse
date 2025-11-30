import 'package:flutter/material.dart';
import 'package:fuzzy_greenhouse/app/presentation/app_colors.dart';
import 'package:fuzzy_greenhouse/greenhouse/presentation/screens/greenhouse_screen.dart';
import 'package:fuzzy_greenhouse/settings/presentation/screens/settings_screen.dart';

enum BottomNavTabs { greenhouse, settings }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          items: _navTabs(),
          selectedItemColor: Colors.white,
          backgroundColor: AppColors.accentColor,
          onTap: (index) => setState(() => _selectedIndex = index),
        ),
      ),
      body: _navTabScreen(),
    );
  }

  List<BottomNavigationBarItem> _navTabs() {
    return BottomNavTabs.values
        .map(
          (e) => switch (e) {
            BottomNavTabs.greenhouse => BottomNavigationBarItem(icon: Icon(Icons.home), label: ("Теплицы")),
            BottomNavTabs.settings => BottomNavigationBarItem(icon: Icon(Icons.manage_accounts), label: ("Настройки")),
          },
        )
        .toList();
  }

  Widget _navTabScreen() {
    return BottomNavTabs.values
        .map((e) {
          return switch (e) {
            BottomNavTabs.greenhouse => GreenhouseScreen(),
            BottomNavTabs.settings => SettingsScreen(),
          };
        })
        .elementAt(_selectedIndex);
  }
}
