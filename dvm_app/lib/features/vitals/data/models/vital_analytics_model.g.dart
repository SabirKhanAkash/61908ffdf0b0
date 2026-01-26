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
      minMax: MinMaxStatsModel.fromJson(
        json['min_max'] as Map<String, dynamic>,
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
  'min_max': instance.minMax,
  'total_logs': instance.totalLogs,
  'latest_timestamp': instance.latestTimestamp,
  'device_count': instance.deviceCount,
  'time_range': instance.timeRange,
};

_MinMaxStatsModel _$MinMaxStatsModelFromJson(
  Map<String, dynamic> json,
) => _MinMaxStatsModel(
  allTime: PeriodStatsModel.fromJson(json['all_time'] as Map<String, dynamic>),
  lastHour: PeriodStatsModel.fromJson(
    json['last_hour'] as Map<String, dynamic>,
  ),
  lastDay: PeriodStatsModel.fromJson(json['last_day'] as Map<String, dynamic>),
  lastWeek: PeriodStatsModel.fromJson(
    json['last_week'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$MinMaxStatsModelToJson(_MinMaxStatsModel instance) =>
    <String, dynamic>{
      'all_time': instance.allTime,
      'last_hour': instance.lastHour,
      'last_day': instance.lastDay,
      'last_week': instance.lastWeek,
    };

_PeriodStatsModel _$PeriodStatsModelFromJson(
  Map<String, dynamic> json,
) => _PeriodStatsModel(
  thermal: MinMaxValuesModel.fromJson(json['thermal'] as Map<String, dynamic>),
  battery: MinMaxValuesModel.fromJson(json['battery'] as Map<String, dynamic>),
  memory: MinMaxValuesModel.fromJson(json['memory'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PeriodStatsModelToJson(_PeriodStatsModel instance) =>
    <String, dynamic>{
      'thermal': instance.thermal,
      'battery': instance.battery,
      'memory': instance.memory,
    };

_MinMaxValuesModel _$MinMaxValuesModelFromJson(Map<String, dynamic> json) =>
    _MinMaxValuesModel(
      min: (json['min'] as num).toDouble(),
      max: (json['max'] as num).toDouble(),
    );

Map<String, dynamic> _$MinMaxValuesModelToJson(_MinMaxValuesModel instance) =>
    <String, dynamic>{'min': instance.min, 'max': instance.max};

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
