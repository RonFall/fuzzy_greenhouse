import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fuzzy_greenhouse/app/app_navigator.dart';
import 'package:fuzzy_greenhouse/app/presentation/app_colors.dart';
import 'package:fuzzy_greenhouse/app/presentation/components/app_flush_bar.dart';
import 'package:fuzzy_greenhouse/auth/domain/bloc/auth_bloc.dart';
import 'package:fuzzy_greenhouse/auth/presentation/screens/auth_screen.dart';
import 'package:fuzzy_greenhouse/greenhouse/presentation/screens/greenhouse_screen.dart';
import 'package:fuzzy_greenhouse/settings/presentation/screens/settings_screen.dart';

enum BottomNavTabs {
  greenhouse(label: 'Теплицы', icon: Icon(Icons.home), screen: GreenhouseScreen()),
  settings(label: 'Настройки', icon: Icon(Icons.manage_accounts), screen: SettingsScreen());

  const BottomNavTabs({required this.label, required this.icon, required this.screen});

  final String label;
  final Widget icon;
  final Widget screen;
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    _showSnackBar();
  }

  Future<void> _showSnackBar() async {
    final blocState = context.read<AuthBloc>().state;
    final message = switch (blocState) {
      AuthBlocStateData() => 'Добро пожаловать',
      _ => '',
    };
    if (message.isEmpty) return;

    await Future.delayed(Duration(seconds: 1));

    if (!mounted) return;

    showSnackBar(context, message: message, messageType: SnackBarMessageType.success);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthBlocState>(
      listener: (context, state) async {
        switch (state) {
          case AuthBlocStateUserDeleted() || AuthBlocStateUserLogout():
            AppNavigator.replaceScreen(context, screen: const AuthScreen());
            break;
          default:
            break;
        }
      },
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          items: BottomNavTabs.values.map((e) => BottomNavigationBarItem(icon: e.icon, label: e.label)).toList(),
          selectedItemColor: Colors.white,
          backgroundColor: AppColors.accentColor,
          onTap: (index) => setState(() => _selectedIndex = index),
        ),
        body: BottomNavTabs.values.map((e) => e.screen).elementAt(_selectedIndex),
      ),
    );
  }
}
