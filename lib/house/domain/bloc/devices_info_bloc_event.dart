part of 'devices_info_bloc.dart';

sealed class DevicesInfoBlocEvent with EquatableMixin {
  const DevicesInfoBlocEvent();

  @override
  List<Object?> get props => [];
}

final class DevicesInfoBlocEventGetClimateInfo extends DevicesInfoBlocEvent {
  const DevicesInfoBlocEventGetClimateInfo();
}
