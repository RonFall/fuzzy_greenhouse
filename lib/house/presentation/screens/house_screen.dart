import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fuzzy_greenhouse/app/app_providers.dart';
import 'package:fuzzy_greenhouse/app/presentation/app_colors.dart';
import 'package:fuzzy_greenhouse/app/presentation/app_text_style.dart';
import 'package:fuzzy_greenhouse/app/presentation/components/components_utils.dart';
import 'package:fuzzy_greenhouse/app/presentation/screens/loading_dialog_screen.dart';
import 'package:fuzzy_greenhouse/auth/presentation/screens/auth_screen.dart';

class HouseScreen extends ConsumerWidget {
  const HouseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    ref.listen<AsyncValue<User?>>(authStateProvider, (prev, next) {
      final uid = next.value?.uid;

      if (next.isLoading) {
        LoadingScreen.instance.show(context: context);
      }
      if (!next.isLoading) {
        LoadingScreen.instance.hide();
      }

      /// Если пользователь вышел - заменяем текущий экран на экран авторизации
      if (uid == null) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const AuthScreen()),
        );
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
              child: Text(
                '${user?.email}',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: AppTextStyle.appBarStyle,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Добро пожаловать!',
              textAlign: TextAlign.center,
              style: AppTextStyle.appBarStyle.copyWith(color: AppColors.black),
            ),
            const HeightFiller(16),
            ElevatedButton(
              onPressed: () => ref.read(authStateProvider.notifier).logOut(),
              child: const Text('Выйти', style: AppTextStyle.buttonTextStyle),
            ),
          ],
        ),
      ),
    );
  }
}
