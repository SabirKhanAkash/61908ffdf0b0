// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vital_analytics_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VitalAnalyticsModel _$VitalAnalyticsModelFromJson(Map<String, dynamic> json) =>
    _VitalAnalyticsModel(
      rollingAverage: RollingAverageModel.fromJson(
        json['rolling_average'] as Map<String, dynamic>,
      ),
      totalLogs: (json['total_logs'] as num).toInt(),
      latestTimestamp: json['latest_timestamp'] as String?,
      deviceCount: (json['device_count'] as num).toInt(),
      timeRange: TimeRangeModel.fromJson(
        json['time_range'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$VitalAnalyticsModelToJson(
  _VitalAnalyticsModel instance,
) => <String, dynamic>{
  'rolling_average': instance.rollingAverage,
  'total_logs': instance.totalLogs,
  'latest_timestamp': instance.latestTimestamp,
  'device_count': instance.deviceCount,
  'time_range': instance.timeRange,
};

_RollingAverageModel _$RollingAverageModelFromJson(Map<String, dynamic> json) =>
    _RollingAverageModel(
      thermal: (json['thermal'] as num).toDouble(),
      battery: (json['battery'] as num).toDouble(),
      memory: (json['memory'] as num).toDouble(),
    );

Map<String, dynamic> _$RollingAverageModelToJson(
  _RollingAverageModel instance,
) => <String, dynamic>{
  'thermal': instance.thermal,
  'battery': instance.battery,
  'memory': instance.memory,
};

_TimeRangeModel _$TimeRangeModelFromJson(Map<String, dynamic> json) =>
    _TimeRangeModel(
      earliest: json['earliest'] as String?,
      latest: json['latest'] as String?,
    );

Map<String, dynamic> _$TimeRangeModelToJson(_TimeRangeModel instance) =>
    <String, dynamic>{'earliest': instance.earliest, 'latest': instance.latest};
