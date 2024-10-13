class GreenhouseClimateData {
  /// Показатели датчиков тепличного хозяйства
  const GreenhouseClimateData({
    this.humidity,
    this.illumination,
    this.temperature,
  });

  /// Влажность
  final int? humidity;

  /// Освещенность
  final int? illumination;

  /// Температура
  final int? temperature;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GreenhouseClimateData &&
          runtimeType == other.runtimeType &&
          illumination == other.illumination;

  @override
  int get hashCode => illumination.hashCode;

  @override
  String toString() {
    return 'GreenhouseClimateData{humidity: $humidity, illumination: $illumination, temperature: $temperature}';
  }
}
