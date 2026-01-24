import 'package:freezed_annotation/freezed_annotation.dart';

part 'sensor_data.freezed.dart';

@freezed
sealed class SensorData with _$SensorData {
  const factory SensorData({
    required int thermalValue, // 0-3
    required double batteryLevel, // 0-100
    required double memoryUsage, // 0-100
    required DateTime timestamp,
  }) = _SensorData;
}
