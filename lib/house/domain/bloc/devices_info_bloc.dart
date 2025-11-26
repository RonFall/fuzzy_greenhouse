import 'package:equatable/equatable.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fuzzy_greenhouse/house/data/models/devices_data.dart';

part 'devices_info_bloc_event.dart';

part 'devices_info_bloc_state.dart';

class DevicesInfoBloc extends Bloc<DevicesInfoBlocEvent, DevicesInfoBlocState> {
  DevicesInfoBloc({required DatabaseReference database})
    : _database = database,
      super(DevicesInfoBlocStateNotInitialized()) {
    on<DevicesInfoBlocEventGetClimateInfo>(_getClimateInfo);
  }

  final DatabaseReference _database;

  Future<void> _getClimateInfo(DevicesInfoBlocEventGetClimateInfo event, Emitter<DevicesInfoBlocState> emit) async {
    if (state is DevicesInfoBlocStateLoading) return;

    try {
      emit(DevicesInfoBlocStateLoading());

      final response = await _database.once();
      final data = response.snapshot.child('devices/antonov').value as Map;

      emit(
        DevicesInfoBlocStateData(
          climateData: GreenhouseClimateData(
            humidity: data['humidity'],
            illumination: data['illumination'],
            temperature: data['temperature'],
          ),
        ),
      );
    } catch (e, s) {
      emit(DevicesInfoBlocStateError(error: e.toString()));

      if (e is Exception) {
        addError(e, s);

        return;
      }

      rethrow;
    }
  }
}
