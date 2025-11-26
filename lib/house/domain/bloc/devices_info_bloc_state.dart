part of 'devices_info_bloc.dart';

sealed class DevicesInfoBlocState with EquatableMixin {
  const DevicesInfoBlocState();

  @override
  List<Object?> get props => [];
}

final class DevicesInfoBlocStateNotInitialized extends DevicesInfoBlocState {
  const DevicesInfoBlocStateNotInitialized();
}

final class DevicesInfoBlocStateLoading extends DevicesInfoBlocState {
  const DevicesInfoBlocStateLoading();
}

final class DevicesInfoBlocStateError extends DevicesInfoBlocState {
  const DevicesInfoBlocStateError({required this.error});

  final String error;

  @override
  List<Object?> get props => [error];
}

final class DevicesInfoBlocStateData extends DevicesInfoBlocState {
  const DevicesInfoBlocStateData({required this.climateData});

  final GreenhouseClimateData climateData;

  @override
  List<Object?> get props => [climateData];
}
