import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fuzzy_greenhouse/house/data/models/devices_data.dart';

class DevicesStateNotifier extends StateNotifier<AsyncValue<DevicesData?>> {
  DevicesStateNotifier({required this.database}) : super(const AsyncData(null));

  final DatabaseReference database;

  Future<void> getDevicesData() async {
    if (state.isLoading) return;

    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final response = await database.once();
      final data = response.snapshot.child('devices/antonov').value as Map;

      return DevicesData(
        humidity: data['humidity'],
        illumination: data['illumination'],
        temperature: data['temperature'],
      );
    });
  }
}
