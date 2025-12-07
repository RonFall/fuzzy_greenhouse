import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fuzzy_greenhouse/app/app_navigator.dart';
import 'package:fuzzy_greenhouse/app/presentation/app_colors.dart';
import 'package:fuzzy_greenhouse/app/presentation/app_text_style.dart';
import 'package:fuzzy_greenhouse/auth/domain/bloc/auth_bloc.dart';
import 'package:fuzzy_greenhouse/settings/presentation/screens/push_notification_panel_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.accentColor,
        title: BlocBuilder<AuthBloc, AuthBlocState>(
          builder: (context, state) {
            final displayName = state is AuthBlocStateData ? state.user.displayName : null;
            final photoURL = state is AuthBlocStateData ? state.user.photoURL : null;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Настройки', maxLines: 1, style: AppTextStyle.appBarStyle),
                Row(
                  spacing: 4,
                  children: [
                    if (photoURL != null && photoURL.isNotEmpty)
                      CircleAvatar(
                        maxRadius: 8,
                        backgroundColor: AppColors.cardColor,
                        child: ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(100),
                          child: Image.network(
                            photoURL,
                            loadingBuilder: (_, child, loadingProgress) {
                              if (loadingProgress == null) return child;

                              return Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: CircularProgressIndicator(strokeWidth: 2),
                              );
                            },
                          ),
                        ),
                      )
                    else if (displayName != null && displayName.isNotEmpty)
                      CircleAvatar(backgroundColor: AppColors.cardColor, child: Text(displayName)),
                    if (displayName != null && displayName.isNotEmpty)
                      Flexible(
                        child: Text(
                          displayName,
                          maxLines: 1,
                          style: AppTextStyle.alertTextStyle.copyWith(fontWeight: FontWeight.w500, color: Colors.white),
                        ),
                      ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
      body: Column(
        children: [
          InkWell(
            onTap: () => AppNavigator.pushScreen(context, screen: const PushNotificationPanelScreen()),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: Icon(Icons.circle_notifications_outlined),
                title: const Text('Управление уведомлениями', maxLines: 1, style: AppTextStyle.bodyTextSubtitleThin),
                trailing: const Icon(Icons.arrow_forward_ios_rounded),
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ),
          Divider(height: 4, indent: 16, endIndent: 16),
          InkWell(
            onTap: () => context.read<AuthBloc>().add(AuthBlocEventLogout()),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: Icon(Icons.logout_outlined),
                title: const Text('Выйти из аккаунта', maxLines: 1, style: AppTextStyle.bodyTextSubtitleThin),
                trailing: const Icon(Icons.arrow_forward_ios_rounded),
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ),
          Divider(height: 4, indent: 16, endIndent: 16),
          InkWell(
            onTap: () => context.read<AuthBloc>().add(AuthBlocEventDeleteAccount()),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: Icon(Icons.delete_outline_outlined, color: AppColors.tempSensorColor),
                title: Text(
                  'Удалить аккаунт',
                  maxLines: 1,
                  style: AppTextStyle.bodyTextSubtitleThin.copyWith(color: AppColors.tempSensorColor),
                ),
                trailing: const Icon(Icons.arrow_forward_ios_rounded, color: AppColors.tempSensorColor),
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
