part of 'greenhouse_devices_info_bloc.dart';

sealed class GreenhouseDevicesInfoBlocEvent with EquatableMixin {
  const GreenhouseDevicesInfoBlocEvent();

  @override
  List<Object?> get props => [];
}

final class GreenhouseDevicesInfoBlocEventGetClimateInfo extends GreenhouseDevicesInfoBlocEvent {
  const GreenhouseDevicesInfoBlocEventGetClimateInfo();
}
