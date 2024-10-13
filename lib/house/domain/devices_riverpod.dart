import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fuzzy_greenhouse/house/data/models/devices_data.dart';

class DevicesStateNotifier extends AsyncNotifier<GreenhouseClimateData?> {
  DevicesStateNotifier({
    required DatabaseReference database,
  }) : _database = database;

  final DatabaseReference _database;

  Future<void> getDevicesData() async {
    if (state.isLoading) return;

    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final response = await _database.once();
      final data = response.snapshot.child('devices/antonov').value as Map;

      return GreenhouseClimateData(
        humidity: data['humidity'],
        illumination: data['illumination'],
        temperature: data['temperature'],
      );
    });
  }

  @override
  FutureOr<GreenhouseClimateData?> build() => state.value;
}
