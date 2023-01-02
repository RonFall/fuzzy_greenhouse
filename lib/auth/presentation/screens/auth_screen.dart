import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fuzzy_greenhouse/app/app_navigator.dart';
import 'package:fuzzy_greenhouse/app/app_providers.dart';
import 'package:fuzzy_greenhouse/app/presentation/app_colors.dart';
import 'package:fuzzy_greenhouse/app/presentation/app_text_style.dart';
import 'package:fuzzy_greenhouse/app/presentation/assets.dart';
import 'package:fuzzy_greenhouse/app/presentation/components/app_snack_bar.dart';
import 'package:fuzzy_greenhouse/app/presentation/components/app_textfield.dart';
import 'package:fuzzy_greenhouse/app/presentation/components/components_utils.dart';
import 'package:fuzzy_greenhouse/app/presentation/screens/loading_dialog_screen.dart';
import 'package:fuzzy_greenhouse/auth/data/repositories/auth_service.dart';
import 'package:fuzzy_greenhouse/house/presentation/screens/house_screen.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginController = ref.watch(loginAuthProvider);
    final passController = ref.watch(passAuthProvider);

    onAuthListen(context, ref);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.accentColor,
        title: const Text('Авторизация', style: AppTextStyle.appBarStyle),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppAssets.authLogo, height: 196, width: 196),
            const HeightFiller(16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: AppTextField(
                controller: loginController,
                hintText: 'Email',
                fieldAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                next: true,
              ),
            ),
            const HeightFiller(8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: AppTextField(
                controller: passController,
                hintText: 'Пароль',
                onComplete: () {
                  onCompleteInput(
                    context,
                    ref,
                    email: loginController.text.trim(),
                    pass: passController.text.trim(),
                  );
                },
              ),
            ),
            const HeightFiller(24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: AppButton(
                height: 48,
                width: double.maxFinite,
                text: 'Войти',
                textStyle: AppTextStyle.buttonTextStyle,
                buttonColor: AppColors.accentColor,
                onPressed: () {
                  onCompleteInput(
                    context,
                    ref,
                    email: loginController.text.trim(),
                    pass: passController.text.trim(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onCompleteInput(
    BuildContext context,
    WidgetRef ref, {
    required String email,
    required String pass,
  }) {
    if (isKeyboardVisible(context)) FocusScope.of(context).unfocus();
    ref.read(authStateProvider.notifier).logIn(email: email, password: pass);
  }

  void onAuthListen(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<User?>>(authStateProvider, (previous, next) {
      if (next.isLoading) {
        LoadingScreen.instance.show(context: context);
      }

      if (next.hasError) {
        if (previous?.isLoading == true) {
          LoadingScreen.instance.hide();
        }

        showFlushBar(
          context,
          message: 'Ошибка: ${(AuthService.mapFirebaseError(next.error))}',
        );
      }
      if (next.hasValue) {
        if (previous?.isLoading == true) LoadingScreen.instance.hide();

        AppNavigator.replaceScreen(context, screen: const HouseScreen());
      }
    });
  }
}
