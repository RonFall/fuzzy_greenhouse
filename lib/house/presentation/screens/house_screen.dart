import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fuzzy_greenhouse/app/presentation/app_colors.dart';
import 'package:fuzzy_greenhouse/app/presentation/app_text_style.dart';
import 'package:fuzzy_greenhouse/app/presentation/screens/loading_dialog_screen.dart';
import 'package:fuzzy_greenhouse/auth/domain/auth_riverpod.dart';
import 'package:fuzzy_greenhouse/auth/presentation/screens/auth_screen.dart';

class HouseScreen extends ConsumerWidget {
  const HouseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    ref.listen<AsyncValue<User?>>(authStateProvider, (prev, next) {
      final uid = next.value?.uid;

      if (prev?.isLoading == false && next.isLoading) {
        LoadingScreen.instance.show(context: context);
      }
      if (prev?.isLoading == true && !next.isLoading) {
        Future.delayed(const Duration(milliseconds: 300)).then((value) {
          LoadingScreen.instance.hide();
        });
      }

      /// Если пользователь вышел - заменяем текущий экран на экран авторизации
      if (uid == null) {
        Future.delayed(const Duration(milliseconds: 300)).then((value) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const AuthScreen()),
          );
        });
      }
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome ${user?.uid}',
              style: AppTextStyle.appBarStyle.copyWith(
                color: AppColors.black,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(authStateProvider.notifier).logOut();
              },
              child: const Text('Выйти', style: AppTextStyle.buttonTextStyle),
            ),
          ],
        ),
      ),
    );
  }
}
