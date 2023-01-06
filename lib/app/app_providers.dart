import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fuzzy_greenhouse/auth/domain/auth_riverpod.dart';

/// Slider
final sliderProvider = StateProvider<double>((ref) => 0);

/// TextEditingController
final loginAuthProvider = Provider.autoDispose<TextEditingController>((ref) {
  final controller = TextEditingController();
  ref.onDispose(() => controller.dispose());
  return controller;
});

final passAuthProvider = Provider.autoDispose<TextEditingController>((ref) {
  final controller = TextEditingController();
  ref.onDispose(() => controller.dispose());
  return controller;
});

/// Auth Providers
final userProvider = Provider<User?>(
  (ref) {
    final authProvider = ref.watch(authStateProvider);
    if (authProvider.hasValue) {
      return authProvider.value;
    }
    return null;
  },
);

final authStateProvider =
    StateNotifierProvider<AuthStateNotifier, AsyncValue<User?>>(
  (ref) => AuthStateNotifier(),
);
