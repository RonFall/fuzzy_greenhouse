import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fuzzy_greenhouse/auth/data/repositories/auth_service.dart';
import 'package:fuzzy_greenhouse/auth/domain/auth_riverpod.dart';
import 'package:fuzzy_greenhouse/house/data/models/devices_data.dart';
import 'package:fuzzy_greenhouse/house/domain/devices_riverpod.dart';

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
final userProvider = Provider<User?>((ref) => ref.watch(authStateProvider).value);

final authStateProvider = AsyncNotifierProvider<AuthStateNotifier, User?>(
  () => AuthStateNotifier(service: AuthService()),
);

/// Devices Providers
final devicesStateProvider = AsyncNotifierProvider<DevicesStateNotifier, GreenhouseClimateData?>(() {
  return DevicesStateNotifier(database: FirebaseDatabase.instance.ref())..getDevicesData();
});
