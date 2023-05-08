import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuzzy_greenhouse/app/app_navigator.dart';
import 'package:fuzzy_greenhouse/app/app_providers.dart';
import 'package:fuzzy_greenhouse/app/presentation/app_colors.dart';
import 'package:fuzzy_greenhouse/app/presentation/app_text_style.dart';
import 'package:fuzzy_greenhouse/app/presentation/assets.dart';
import 'package:fuzzy_greenhouse/app/presentation/components/components_utils.dart';
import 'package:fuzzy_greenhouse/app/presentation/screens/loading_dialog_screen.dart';
import 'package:fuzzy_greenhouse/auth/presentation/screens/auth_screen.dart';
import 'package:fuzzy_greenhouse/house/presentation/screens/add_greenhouse_screen.dart';
import 'package:fuzzy_greenhouse/house/presentation/screens/house_sensors_info_screen.dart';

class HouseScreen extends ConsumerWidget {
  const HouseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    ref.listen<AsyncValue<User?>>(authStateProvider, (prev, next) {
      final uid = next.value?.uid;

      if (next.isLoading) LoadingScreen.instance.show(context: context);
      if (!next.isLoading) LoadingScreen.instance.hide();

      // Если пользователь вышел - заменяем текущий экран на экран авторизации
      if (uid == null) {
        AppNavigator.replaceScreen(context, screen: const AuthScreen());
      }
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.accentColor,
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: AppColors.cardColor,
              child: Text('${user?.email?[0]}'),
            ),
            const WidthFiller(12),
            Flexible(
              child: AutoSizeText(
                '${user?.email}',
                maxLines: 1,
                style: AppTextStyle.appBarStyle,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: ref.read(authStateProvider.notifier).logOut,
            icon: const Icon(Icons.exit_to_app_rounded, size: 28),
          )
        ],
      ),
      body: InkWell(
        onTap: () {
          AppNavigator.pushScreen(
            context,
            screen: const HouseSensorsInfoScreen(),
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: AppColors.inputFieldColor,
              radius: 24,
              child: SvgPicture.asset(
                AppVectorAssets.greenhouseItem,
                height: 24,
                width: 24,
              ),
            ),
            title: const AutoSizeText(
              'Антоновская',
              maxLines: 1,
              style: AppTextStyle.bodyTextSubtitleThin,
            ),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          ),
        ),
      ),
    );
  }
}

class HouseEmptyView extends StatelessWidget {
  const HouseEmptyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppAssets.greenhouseEmptyScreen, height: 128, width: 128),
          const HeightFiller(16),
          Text(
            'У вас нет добавленных\nтеплиц.',
            textAlign: TextAlign.center,
            style: AppTextStyle.appBarStyle.copyWith(color: AppColors.black),
          ),
          const HeightFiller(16),
          AppButton(
            height: 48,
            width: screenWidth(context) / 1.5,
            text: 'Добавить',
            textStyle: AppTextStyle.buttonTextStyle,
            buttonColor: AppColors.accentColor,
            onPressed: () {
              AppNavigator.pushScreen(
                context,
                screen: const AddGreenhouseScreen(),
              );
            },
          ),
        ],
      ),
    );
  }
}
