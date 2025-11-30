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
import 'package:fuzzy_greenhouse/auth/presentation/screens/auth_screen.dart';
import 'package:fuzzy_greenhouse/home/presentation/screens/home_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late final _loginTextController = TextEditingController();
  late final _passwordTextController = TextEditingController();
  late final _nameTextController = TextEditingController();
  late final _photoURLTextController = TextEditingController();
  late final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _loginTextController.dispose();
    _passwordTextController.dispose();
    _nameTextController.dispose();
    _photoURLTextController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) AppNavigator.replaceScreen(context, screen: const AuthScreen());
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.accentColor,
          title: const Text('Регистрация', style: AppTextStyle.appBarStyle),
          centerTitle: true,
          foregroundColor: Colors.white,
          leading: InkWell(
            onTap: () => AppNavigator.replaceScreen(context, screen: const AuthScreen()),
            child: Icon(Icons.arrow_back_rounded),
          ),
        ),
        body: BlocProvider.value(
          value: context.read<AuthBloc?>() ?? AuthBloc(service: AuthService()),
          child: BlocListener<AuthBloc, AuthBlocState>(
            listener: _onAuthListen,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppAssets.authLogo, scale: 2.4),
                    const SizedBox(height: 16),
                    AppTextField(
                      controller: _loginTextController,
                      hintText: 'Email',
                      prefixIcon: Icon(Icons.email_outlined),
                      fieldAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      hasClearButton: true,
                      next: true,
                      validator: (text) {
                        if (text?.isEmpty ?? true) return 'Поле не может быть пустым';
                        return null;
                      },
                    ),
                    const SizedBox(height: 8),
                    AppTextField(
                      controller: _passwordTextController,
                      hintText: 'Пароль',
                      prefixIcon: Icon(Icons.key),
                      showObscuredText: true,
                      hasClearButton: true,
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      next: true,
                      validator: (text) {
                        if (text?.isEmpty ?? true) return 'Поле не может быть пустым';
                        return null;
                      },
                    ),
                    const SizedBox(height: 8),
                    Text('По желанию', style: AppTextStyle.alertTextStyle),
                    const SizedBox(height: 8),
                    AppTextField(
                      controller: _nameTextController,
                      hintText: 'Имя',
                      prefixIcon: Icon(Icons.person_2_outlined),
                      hasClearButton: true,
                      next: true,
                    ),
                    const SizedBox(height: 8),
                    AppTextField(
                      controller: _photoURLTextController,
                      hintText: 'Ссылка для аватарки',
                      prefixIcon: Icon(Icons.photo_album_outlined),
                      hasClearButton: true,
                      next: true,
                    ),
                    const SizedBox(height: 24),
                    AppButton(
                      height: 48,
                      width: double.maxFinite,
                      text: 'Регистрация',
                      textStyle: AppTextStyle.buttonTextStyle,
                      buttonColor: AppColors.accentColor,
                      onPressed: () => _onCompleteInput(context),
                    ),
                  ],
                ),
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
      AuthBlocEventRegister(
        email: _loginTextController.text,
        password: _passwordTextController.text,
        name: _nameTextController.text,
        photoURL: _photoURLTextController.text,
      ),
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
        AppNavigator.pushAndRemoveUntil(context, screen: const HomeScreen());

        break;
      default:
        break;
    }
  }
}
