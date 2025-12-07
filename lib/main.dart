import 'dart:async';
import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fuzzy_greenhouse/app/domain/firebase/firebase_init_service.dart';
import 'package:fuzzy_greenhouse/auth/data/repositories/auth_service.dart';
import 'package:fuzzy_greenhouse/auth/domain/bloc/auth_bloc.dart';
import 'package:fuzzy_greenhouse/auth/presentation/screens/auth_screen.dart';
import 'package:fuzzy_greenhouse/firebase_options.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fuzzy_greenhouse/home/presentation/screens/home_screen.dart';

Future<void> main() async {
  FlutterError.onError = (details) {
    debugPrint('Flutter error: ${details.exceptionAsString()}');
    FlutterError.presentError(details);
  };
  PlatformDispatcher.instance.onError = (error, _) {
    debugPrint('Platform error: $error');
    return true;
  };

  // TODO(RonFall): Доработать отправку ошибок
  ErrorWidget.builder = (details) {
    final warnTextColor = Colors.yellow[600];
    return ColoredBox(
      color: Colors.red[300]!,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Ошибка при репрезентации UI', style: TextStyle(fontSize: 24, color: warnTextColor)),
            SizedBox(height: 16),
            Text('Детали:', style: TextStyle(fontSize: 16, color: warnTextColor)),
            SizedBox(height: 16),
            Flexible(
              child: ListView(children: [SelectableText(details.toString(), style: TextStyle(color: warnTextColor))]),
            ),
            SizedBox(height: 16),
            ElevatedButton(onPressed: () {}, child: Text('Отправить лог')),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  };

  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

    FirebaseMessaging.onBackgroundMessage(FirebaseInitService.firebaseMessagingBackgroundHandler);

    await FirebaseInitService.initLocalNotifications();

    runApp(MyApp());
  }, (error, _) => debugPrint('Initialization error: $error'));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthBloc(service: AuthService()),
      child: BlocBuilder<AuthBloc, AuthBlocState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Fuzzy Greenhouse',
            debugShowCheckedModeBanner: false,
            home: switch (state) {
              AuthBlocStateData() => const HomeScreen(),
              _ => const AuthScreen(),
            },
          );
        },
      ),
    );
  }
}
