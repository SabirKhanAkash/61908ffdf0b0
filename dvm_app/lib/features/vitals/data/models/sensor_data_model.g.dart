// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sensor_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SensorDataModel _$SensorDataModelFromJson(Map<String, dynamic> json) =>
    _SensorDataModel(
      thermalValue: (json['thermal_value'] as num).toInt(),
      batteryLevel: (json['battery_level'] as num).toDouble(),
      memoryUsage: (json['memory_usage'] as num).toDouble(),
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$SensorDataModelToJson(_SensorDataModel instance) =>
    <String, dynamic>{
      'thermal_value': instance.thermalValue,
      'battery_level': instance.batteryLevel,
      'memory_usage': instance.memoryUsage,
      'timestamp': instance.timestamp.toIso8601String(),
    };
