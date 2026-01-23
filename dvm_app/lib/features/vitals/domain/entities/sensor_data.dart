import 'package:freezed_annotation/freezed_annotation.dart';

part 'sensor_data.freezed.dart';

/// Domain entity for sensor data
/// This represents the current state of device sensors
@freezed
sealed class SensorData with _$SensorData {
  const factory SensorData({
    required double thermalValue, // 0-3
    required double batteryLevel, // 0-100
    required double memoryUsage, // 0-100
    required DateTime timestamp,
  }) = _SensorData;
}
