import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:fuzzy_greenhouse/auth/data/repositories/auth_service.dart';

class AuthStateNotifier extends StateNotifier<AsyncValue<User?>> {
  AuthStateNotifier({required this.service}) : super(const AsyncData(null)) {
    if (service.isAlreadyLoggedIn) state = AsyncData(service.user);
  }

  final AuthService service;

  Future<void> logOut() async {
    if (state.isLoading) return;

    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await service.logOut();
      return null;
    });
  }

  Future<void> logIn({required String email, required String password}) async {
    if (state.isLoading) return;

    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final response = await service.logIn(
        email: email,
        password: password,
      );
      return response.user;
    });
  }
}
