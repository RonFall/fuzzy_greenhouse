import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fuzzy_greenhouse/app/app_navigator.dart';
import 'package:fuzzy_greenhouse/app/presentation/app_colors.dart';
import 'package:fuzzy_greenhouse/app/presentation/app_text_style.dart';
import 'package:fuzzy_greenhouse/app/presentation/assets.dart';
import 'package:fuzzy_greenhouse/app/presentation/components/app_flush_bar.dart';
import 'package:fuzzy_greenhouse/app/presentation/components/components_utils.dart';
import 'package:fuzzy_greenhouse/app/presentation/screens/loading_dialog_screen.dart';
import 'package:fuzzy_greenhouse/auth/domain/bloc/auth_bloc.dart';
import 'package:fuzzy_greenhouse/house/presentation/screens/add_greenhouse_screen.dart';
import 'package:fuzzy_greenhouse/house/presentation/screens/house_sensors_info_screen.dart';

class HouseScreen extends StatelessWidget {
  const HouseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.accentColor,
        title: BlocBuilder<AuthBloc, AuthBlocState>(
          builder: (context, state) {
            final email = state is AuthBlocStateData ? state.user?.email : null;
            return Row(
              children: [
                CircleAvatar(backgroundColor: AppColors.cardColor, child: Text(email != null ? email[0] : 'G')),
                const SizedBox(width: 12),
                Flexible(child: Text(email ?? 'guest', maxLines: 1, style: AppTextStyle.appBarStyle)),
              ],
            );
          },
        ),
        actions: [
          IconButton(
            onPressed: () => context.read<AuthBloc>().add(AuthBlocEventLogout()),
            icon: const Icon(Icons.exit_to_app_rounded, size: 28),
          ),
        ],
      ),
      body: InkWell(
        onTap: () => AppNavigator.pushScreen(context, screen: const HouseSensorsInfoScreen()),
        child: BlocListener<AuthBloc, AuthBlocState>(
          listener: _onAuthListen,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: AppColors.inputFieldColor,
                radius: 24,
                child: AppVectorAssets.greenhouseItem,
              ),
              title: const Text('Антоновская', maxLines: 1, style: AppTextStyle.bodyTextSubtitleThin),
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

@visibleForTesting
class HouseEmptyView extends StatelessWidget {
  @visibleForTesting
  const HouseEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppAssets.greenhouseEmptyScreen, height: 128, width: 128),
          const SizedBox(height: 16),
          Text(
            'У вас нет добавленных\nтеплиц.',
            textAlign: TextAlign.center,
            style: AppTextStyle.appBarStyle.copyWith(color: AppColors.black),
          ),
          const SizedBox(height: 16),
          AppButton(
            height: 48,
            width: screenWidth(context) / 1.5,
            text: 'Добавить',
            textStyle: AppTextStyle.buttonTextStyle,
            buttonColor: AppColors.accentColor,
            onPressed: () => AppNavigator.pushScreen(context, screen: const AddGreenhouseScreen()),
          ),
        ],
      ),
    );
  }
}
