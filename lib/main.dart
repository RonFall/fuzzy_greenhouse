import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fuzzy_greenhouse/app/app_providers.dart';
import 'package:fuzzy_greenhouse/auth/presentation/screens/auth_screen.dart';
import 'package:fuzzy_greenhouse/house/presentation/screens/house_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

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

// class SensorData extends StatelessWidget {
//   const SensorData({
//     Key? key,
//     required this.path,
//     required this.dataWidget,
//   }) : super(key: key);
//
//   final String path;
//   final Widget Function(String) dataWidget;
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<GreenhouseSensorsCubit, data.AsyncData<String>>(
//       bloc: GreenhouseSensorsCubit()..getSensorsData(path: path),
//       builder: (context, state) {
//         return state.when(
//           onLoading: () => const CircularProgressIndicator(),
//           onError: (error) => Text(error),
//           onData: dataWidget,
//         );
//       },
//     );
//   }
// }
