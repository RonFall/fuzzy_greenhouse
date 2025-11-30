import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fuzzy_greenhouse/app/app_navigator.dart';
import 'package:fuzzy_greenhouse/app/presentation/app_colors.dart';
import 'package:fuzzy_greenhouse/app/presentation/app_text_style.dart';
import 'package:fuzzy_greenhouse/app/presentation/components/app_flush_bar.dart';
import 'package:fuzzy_greenhouse/app/presentation/screens/loading_dialog_screen.dart';
import 'package:fuzzy_greenhouse/auth/domain/bloc/auth_bloc.dart';
import 'package:fuzzy_greenhouse/greenhouse/presentation/screens/greenhouse_sensors_info_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.accentColor,
        title: Text('Настройки', maxLines: 1, style: AppTextStyle.appBarStyle),
        actions: [
          IconButton(
            onPressed: () => context.read<AuthBloc>().add(AuthBlocEventLogout()),
            icon: const Icon(Icons.exit_to_app_rounded, size: 28, color: Colors.white),
          ),
        ],
      ),
      body: InkWell(
        // TODO(RonFall): Добавить экран отправки уведомлений
        onTap: () => AppNavigator.pushScreen(context, screen: const GreenhouseSensorsInfoScreen()),
        child: BlocListener<AuthBloc, AuthBlocState>(
          listener: _onAuthListen,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: Icon(Icons.circle_notifications_outlined),
              title: const Text('Управление уведомлениями', maxLines: 1, style: AppTextStyle.bodyTextSubtitleThin),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
            ),
          ),
        ),
      ),
    );
  }

  void _onAuthListen(BuildContext context, AuthBlocState state) {
    switch (state) {
      case AuthBlocStateLoading():
        LoadingScreen.instance.show(context);
        break;

      case AuthBlocStateError():
        LoadingScreen.instance.hide();

        showSnackBar(context, message: 'Ошибка: ${state.error}');
        break;

      case AuthBlocStateData():
        LoadingScreen.instance.hide();

        break;
      default:
        break;
    }
  }
}
