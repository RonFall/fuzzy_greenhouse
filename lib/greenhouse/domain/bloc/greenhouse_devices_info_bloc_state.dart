part of 'greenhouse_devices_info_bloc.dart';

sealed class GreenhouseDevicesInfoBlocState with EquatableMixin {
  const GreenhouseDevicesInfoBlocState();

  @override
  List<Object?> get props => [];
}

final class GreenhouseDevicesInfoBlocStateNotInitialized extends GreenhouseDevicesInfoBlocState {
  const GreenhouseDevicesInfoBlocStateNotInitialized();
}

final class GreenhouseDevicesInfoBlocStateLoading extends GreenhouseDevicesInfoBlocState {
  const GreenhouseDevicesInfoBlocStateLoading();
}

final class GreenhouseDevicesInfoBlocStateError extends GreenhouseDevicesInfoBlocState {
  const GreenhouseDevicesInfoBlocStateError({required this.error});

  final dynamic error;

  @override
  List<Object?> get props => [error];
}

final class GreenhouseDevicesInfoBlocStateData extends GreenhouseDevicesInfoBlocState {
  const GreenhouseDevicesInfoBlocStateData({required this.climateData});

  final GreenhouseClimateData climateData;

  @override
  List<Object?> get props => [climateData];
}
