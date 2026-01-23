// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/vital_log.dart';

part 'vital_log_model.freezed.dart';
part 'vital_log_model.g.dart';

@freezed
sealed class VitalLogModel with _$VitalLogModel {
  const VitalLogModel._();

  const factory VitalLogModel({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'device_id') required String deviceId,
    @JsonKey(name: 'timestamp') required DateTime timestamp,
    @JsonKey(name: 'thermal_value') required double thermalValue,
    @JsonKey(name: 'battery_level') required double batteryLevel,
    @JsonKey(name: 'memory_usage') required double memoryUsage,
  }) = _VitalLogModel;

  factory VitalLogModel.fromJson(Map<String, dynamic> json) =>
      _$VitalLogModelFromJson(json);

  // Convert to domain entity
  VitalLog toEntity() {
    return VitalLog(
      id: id,
      deviceId: deviceId,
      timestamp: timestamp,
      thermalValue: thermalValue,
      batteryLevel: batteryLevel,
      memoryUsage: memoryUsage,
    );
  }

  // Convert to data model
  factory VitalLogModel.fromEntity(VitalLog entity) {
    return VitalLogModel(
      id: entity.id,
      deviceId: entity.deviceId,
      timestamp: entity.timestamp,
      thermalValue: entity.thermalValue,
      batteryLevel: entity.batteryLevel,
      memoryUsage: entity.memoryUsage,
    );
  }
}
