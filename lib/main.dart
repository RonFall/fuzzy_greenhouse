import 'dart:async';
import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fuzzy_greenhouse/app/app_providers.dart';
import 'package:fuzzy_greenhouse/auth/presentation/screens/auth_screen.dart';
import 'package:fuzzy_greenhouse/firebase_options.dart';
import 'package:fuzzy_greenhouse/house/presentation/screens/house_screen.dart';

Future<void> main() async {
  FlutterError.onError = (details) {
    debugPrint('Flutter error: ${details.exceptionAsString()}');
    FlutterError.presentError(details);
  };
  PlatformDispatcher.instance.onError = (error, _) {
    debugPrint('Platform error: $error');
    return true;
  };

  ErrorWidget.builder = (details) {
    return const Text(
      'Ошибка при репрезентации UI',
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.black, fontSize: 24),
    );
  };

  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

    runApp(const ProviderScope(child: MyApp()));
  }, (error, _) => debugPrint('Initialization error: $error'));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Fuzzy Greenhouse',
      debugShowCheckedModeBanner: false,
      home: Consumer(
        builder: (context, ref, child) {
          final uid = ref.watch(userProvider)?.uid;
          if (uid != null) return const HouseScreen();

          return const AuthScreen();
        },
      ),
    );
  }
}
