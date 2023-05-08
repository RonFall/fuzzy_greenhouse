import 'package:freezed_annotation/freezed_annotation.dart';

part 'devices_data.freezed.dart';

@freezed
class DevicesData with _$DevicesData {
  /// Показатели датчиков тепличного хозяйства
  const factory DevicesData({
    /// Влажность
    int? humidity,

    /// Освещенность
    int? illumination,

    /// Температура
    int? temperature,
  }) = _DevicesData;
}
