import 'package:equatable/equatable.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fuzzy_greenhouse/greenhouse/data/models/greenhouse_climate_data.dart';

part 'greenhouse_devices_info_bloc_event.dart';

part 'greenhouse_devices_info_bloc_state.dart';

class GreenhouseDevicesInfoBloc extends Bloc<GreenhouseDevicesInfoBlocEvent, GreenhouseDevicesInfoBlocState> {
  GreenhouseDevicesInfoBloc({required DatabaseReference database})
    : _database = database,
      super(GreenhouseDevicesInfoBlocStateNotInitialized()) {
    on<GreenhouseDevicesInfoBlocEventGetClimateInfo>(_getClimateInfo);
  }

  final DatabaseReference _database;

  Future<void> _getClimateInfo(
    GreenhouseDevicesInfoBlocEventGetClimateInfo event,
    Emitter<GreenhouseDevicesInfoBlocState> emit,
  ) async {
    if (state is GreenhouseDevicesInfoBlocStateLoading) return;

    try {
      emit(GreenhouseDevicesInfoBlocStateLoading());

      final response = await _database.once();
      final data = response.snapshot.child('devices/antonov').value as Map;

      emit(
        GreenhouseDevicesInfoBlocStateData(
          climateData: GreenhouseClimateData(
            humidity: data['humidity'],
            illumination: data['illumination'],
            temperature: data['temperature'],
          ),
        ),
      );
    } catch (e, s) {
      emit(GreenhouseDevicesInfoBlocStateError(error: e));

      if (e is Exception) {
        addError(e, s);

        return;
      }

      rethrow;
    }
  }
}
