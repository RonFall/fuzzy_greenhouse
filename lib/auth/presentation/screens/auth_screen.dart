import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/gestures.dart';
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
import 'package:fuzzy_greenhouse/auth/presentation/screens/register_screen.dart';
import 'package:fuzzy_greenhouse/home/presentation/screens/home_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late final _loginTextController = TextEditingController();
  late final _passwordTextController = TextEditingController();
  late final _loginFocusNode = FocusNode();
  late final _passwordFocusNode = FocusNode();
  late final _formKey = GlobalKey<FormState>();
  late final TapGestureRecognizer _textRegisterRecognizer;

  @override
  void initState() {
    super.initState();
    _textRegisterRecognizer =
        TapGestureRecognizer()
          ..onTap = () {
            _loginFocusNode.unfocus();
            _passwordFocusNode.unfocus();
            AppNavigator.replaceScreen(context, screen: const RegisterScreen());
          };

    _showSnackBar();
  }

  Future<void> _showSnackBar() async {
    final blocState = context.read<AuthBloc>().state;
    final message = switch (blocState) {
      AuthBlocStateUserNotFound() => 'Аккаунт не найден',
      AuthBlocStateUserDeleted() => 'Аккаунт удален',
      AuthBlocStateUserLogout() => 'Успешный выход',
      _ => '',
    };
    if (message.isEmpty) return;

    await Future.delayed(Duration(seconds: 1));

    if (!mounted) return;

    showSnackBar(
      context,
      message: message,
      messageType: switch (blocState) {
        AuthBlocStateUserDeleted() || AuthBlocStateUserNotFound() => SnackBarMessageType.warning,
        _ => SnackBarMessageType.success,
      },
    );
  }

  @override
  void dispose() {
    _loginTextController.dispose();
    _passwordTextController.dispose();
    _loginFocusNode.dispose();
    _passwordFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.sizeOf(context).height * 0.15;

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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  SizedBox(height: topPadding),
                  Image.asset(AppAssets.authLogo, height: 196, width: 196),
                  const SizedBox(height: 16),
                  AppTextField(
                    controller: _loginTextController,
                    focusNode: _loginFocusNode,
                    hintText: 'Email',
                    prefixIcon: Icon(Icons.email_outlined),
                    fieldAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    hasClearButton: true,
                    onComplete: _passwordFocusNode.requestFocus,
                    validator: (text) {
                      if (text?.isEmpty ?? true) return 'Поле не может быть пустым';
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  AppTextField(
                    controller: _passwordTextController,
                    focusNode: _passwordFocusNode,
                    hintText: 'Пароль',
                    prefixIcon: Icon(Icons.key),
                    showObscuredText: true,
                    hasClearButton: true,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    validator: (text) {
                      if (text?.isEmpty ?? true) return 'Поле не может быть пустым';
                      return null;
                    },
                    onComplete: () => _onCompleteInput(context),
                  ),
                  const SizedBox(height: 24),
                  AppButton(
                    height: 48,
                    width: double.maxFinite,
                    text: 'Войти',
                    textStyle: AppTextStyle.buttonTextStyle,
                    buttonColor: AppColors.accentColor,
                    onPressed: () => _onCompleteInput(context),
                  ),
                  const SizedBox(height: 12),
                  Align(
                    child: RichText(
                      text: TextSpan(
                        text: 'Нет аккаунта? ',
                        style: AppTextStyle.alertTextStyle,
                        children: [
                          TextSpan(
                            text: 'Зарегистрируйтесь',
                            style: AppTextStyle.alertTextStyle.copyWith(color: AppColors.textLinkColor),
                            recognizer: _textRegisterRecognizer,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onCompleteInput(BuildContext context) {
    if (isKeyboardVisible(context)) FocusScope.of(context).unfocus();

    final validate = _formKey.currentState?.validate() ?? false;
    if (!validate) return;

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
        final token = await FirebaseMessaging.instance.getToken();
        if (token == null) return;

        FirebaseInitService.saveCredentials(
          uid: user.uid,
          token: token,
          email: user.email,
          displayName: user.displayName,
          photoURL: user.photoURL,
        );

        if (!context.mounted) return;
        AppNavigator.replaceScreen(context, screen: const HomeScreen());

        break;
      default:
        break;
    }
  }
}
