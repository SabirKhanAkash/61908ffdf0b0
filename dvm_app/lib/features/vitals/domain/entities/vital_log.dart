import 'package:freezed_annotation/freezed_annotation.dart';

part 'vital_log.freezed.dart';

@freezed
sealed class VitalLog with _$VitalLog {
  const factory VitalLog({
    @Default(0) int id,
    @Default('') String deviceId,
    required DateTime timestamp,
    @Default(0) int thermalValue,
    @Default(0.0) double batteryLevel,
    @Default(0.0) double memoryUsage,
  }) = _VitalLog;
}
