import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:fuzzy_greenhouse/auth/data/repositories/auth_service.dart';

class AuthStateNotifier extends AsyncNotifier<User?> {
  AuthStateNotifier({required AuthService service}) : _service = service {
    if (service.isAlreadyLoggedIn) state = AsyncData(service.user);
  }

  final AuthService _service;

  Future<void> logOut() async {
    if (state.isLoading) return;

    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _service.logOut();
      return null;
    });
  }

  Future<void> logIn({required String email, required String password}) async {
    if (state.isLoading) return;

    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final response = await _service.logIn(email: email, password: password);

      return response.user;
    });
  }

  @override
  FutureOr<User?> build() => state.value;
}
