import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fuzzy_greenhouse/app/app_navigator.dart';
import 'package:fuzzy_greenhouse/app/domain/firebase/firebase_init_service.dart';
import 'package:fuzzy_greenhouse/app/presentation/app_colors.dart';
import 'package:fuzzy_greenhouse/app/presentation/app_text_style.dart';
import 'package:fuzzy_greenhouse/app/presentation/assets.dart';
import 'package:fuzzy_greenhouse/app/presentation/components/app_flush_bar.dart';
import 'package:fuzzy_greenhouse/app/presentation/components/app_textfield.dart';
import 'package:fuzzy_greenhouse/app/presentation/components/components_utils.dart';
import 'package:fuzzy_greenhouse/app/presentation/screens/loading_dialog_screen.dart';
import 'package:fuzzy_greenhouse/auth/data/repositories/auth_service.dart';
import 'package:fuzzy_greenhouse/auth/domain/bloc/auth_bloc.dart';
import 'package:fuzzy_greenhouse/house/presentation/screens/house_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late final _loginTextController = TextEditingController();
  late final _passwordTextController = TextEditingController();

  @override
  void dispose() {
    _loginTextController.dispose();
    _passwordTextController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.accentColor,
        title: const Text('Авторизация', style: AppTextStyle.appBarStyle),
        centerTitle: true,
      ),
      body: BlocProvider.value(
        value: context.read<AuthBloc?>() ?? AuthBloc(service: AuthService()),
        child: BlocListener<AuthBloc, AuthBlocState>(
          listener: _onAuthListen,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppAssets.authLogo, height: 196, width: 196),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: AppTextField(
                    controller: _loginTextController,
                    hintText: 'Email',
                    fieldAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    next: true,
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: AppTextField(
                    controller: _passwordTextController,
                    hintText: 'Пароль',
                    onComplete: () => _onCompleteInput(context),
                  ),
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: AppButton(
                    height: 48,
                    width: double.maxFinite,
                    text: 'Войти',
                    textStyle: AppTextStyle.buttonTextStyle,
                    buttonColor: AppColors.accentColor,
                    onPressed: () => _onCompleteInput(context),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onCompleteInput(BuildContext context) {
    if (isKeyboardVisible(context)) FocusScope.of(context).unfocus();

    context.read<AuthBloc>().add(
      AuthBlocEventLogin(email: _loginTextController.text, password: _passwordTextController.text),
    );
  }

  Future<void> _onAuthListen(BuildContext context, AuthBlocState state) async {
    switch (state) {
      case AuthBlocStateLoading():
        LoadingScreen.instance.show(context);
        break;

      case AuthBlocStateError():
        LoadingScreen.instance.hide();

        showSnackBar(context, message: 'Ошибка: ${(AuthService.mapFirebaseError(state.error))}');
        break;

      case AuthBlocStateData():
        LoadingScreen.instance.hide();

        final user = state.user;
        if (user == null) return;

        final token = await FirebaseMessaging.instance.getToken();
        if (token == null) return;

        FirebaseInitService.saveCredentials(uid: user.uid, token: token, email: user.email);

        if (!context.mounted) return;
        AppNavigator.replaceScreen(context, screen: const HouseScreen());

        break;
      default:
        break;
    }
  }
}
