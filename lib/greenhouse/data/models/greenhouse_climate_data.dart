import 'package:equatable/equatable.dart';

class GreenhouseClimateData with EquatableMixin {
  /// Показатели датчиков тепличного хозяйства
  const GreenhouseClimateData({this.humidity, this.illumination, this.temperature});

  /// Влажность
  final int? humidity;

  /// Освещенность
  final int? illumination;

  /// Температура
  final int? temperature;

  @override
  List<Object?> get props => [humidity, illumination, temperature];
}
