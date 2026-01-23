// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vital_log_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VitalLogModel _$VitalLogModelFromJson(Map<String, dynamic> json) =>
    _VitalLogModel(
      id: (json['id'] as num).toInt(),
      deviceId: json['device_id'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      thermalValue: (json['thermal_value'] as num).toDouble(),
      batteryLevel: (json['battery_level'] as num).toDouble(),
      memoryUsage: (json['memory_usage'] as num).toDouble(),
    );

Map<String, dynamic> _$VitalLogModelToJson(_VitalLogModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'device_id': instance.deviceId,
      'timestamp': instance.timestamp.toIso8601String(),
      'thermal_value': instance.thermalValue,
      'battery_level': instance.batteryLevel,
      'memory_usage': instance.memoryUsage,
    };
