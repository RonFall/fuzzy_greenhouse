import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:fuzzy_greenhouse/auth/data/repositories/auth_service.dart';

class AuthStateNotifier extends StateNotifier<AsyncValue<User?>> {
  final _authService = AuthService();

  AuthStateNotifier() : super(const AsyncLoading()) {
    if (_authService.isAlreadyLoggedIn) {
      state = AsyncData(_authService.user);
    }
  }

  Future<void> logOut() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _authService.logOut();
      return null;
    });
  }

  Future<void> logIn({required String email, required String password}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final response = await _authService.logIn(
        email: email,
        password: password,
      );
      return response.user;
    });
  }
}
