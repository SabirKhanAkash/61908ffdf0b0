// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/sensor_data.dart';

part 'sensor_data_model.freezed.dart';
part 'sensor_data_model.g.dart';

/// Data model for SensorData
/// Extends the domain entity and adds JSON serialization
@freezed
sealed class SensorDataModel with _$SensorDataModel {
  const SensorDataModel._();

  const factory SensorDataModel({
    @JsonKey(name: 'thermal_value') required double thermalValue,
    @JsonKey(name: 'battery_level') required double batteryLevel,
    @JsonKey(name: 'memory_usage') required double memoryUsage,
    required DateTime timestamp,
  }) = _SensorDataModel;

  factory SensorDataModel.fromJson(Map<String, dynamic> json) =>
      _$SensorDataModelFromJson(json);

  /// Create from native platform response
  factory SensorDataModel.fromPlatform(Map<dynamic, dynamic> map) {
    return SensorDataModel(
      thermalValue: (map['thermal_value'] as num).toDouble(),
      batteryLevel: (map['battery_level'] as num).toDouble(),
      memoryUsage: (map['memory_usage'] as num).toDouble(),
      timestamp: DateTime.now(), // Current time when fetched
    );
  }

  /// Convert to domain entity
  SensorData toEntity() {
    return SensorData(
      thermalValue: thermalValue,
      batteryLevel: batteryLevel,
      memoryUsage: memoryUsage,
      timestamp: timestamp,
    );
  }
}
