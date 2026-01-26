// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/vital_analytics.dart';

part 'vital_analytics_model.freezed.dart';
part 'vital_analytics_model.g.dart';

@freezed
sealed class VitalAnalyticsModel with _$VitalAnalyticsModel {
  const VitalAnalyticsModel._();

  const factory VitalAnalyticsModel({
    @JsonKey(name: 'rolling_average')
    required RollingAverageModel rollingAverage,
    @JsonKey(name: 'min_max') required MinMaxStatsModel minMax,
    @JsonKey(name: 'total_logs') required int totalLogs,
    @JsonKey(name: 'latest_timestamp') String? latestTimestamp,
    @JsonKey(name: 'device_count') required int deviceCount,
    @JsonKey(name: 'time_range') required TimeRangeModel timeRange,
  }) = _VitalAnalyticsModel;

  factory VitalAnalyticsModel.fromJson(Map<String, dynamic> json) =>
      _$VitalAnalyticsModelFromJson(json);

  /// Convert to domain entity
  VitalAnalytics toEntity() {
    return VitalAnalytics(
      rollingAverage: rollingAverage.toEntity(),
      minMax: minMax.toEntity(),
      totalLogs: totalLogs,
      latestTimestamp: latestTimestamp,
      deviceCount: deviceCount,
      timeRange: timeRange.toEntity(),
    );
  }
}

@freezed
sealed class MinMaxStatsModel with _$MinMaxStatsModel {
  const MinMaxStatsModel._();

  const factory MinMaxStatsModel({
    @JsonKey(name: 'all_time') required PeriodStatsModel allTime,
    @JsonKey(name: 'last_hour') required PeriodStatsModel lastHour,
    @JsonKey(name: 'last_day') required PeriodStatsModel lastDay,
    @JsonKey(name: 'last_week') required PeriodStatsModel lastWeek,
  }) = _MinMaxStatsModel;

  factory MinMaxStatsModel.fromJson(Map<String, dynamic> json) =>
      _$MinMaxStatsModelFromJson(json);

  MinMaxStats toEntity() {
    return MinMaxStats(
      allTime: allTime.toEntity(),
      lastHour: lastHour.toEntity(),
      lastDay: lastDay.toEntity(),
      lastWeek: lastWeek.toEntity(),
    );
  }
}

@freezed
sealed class PeriodStatsModel with _$PeriodStatsModel {
  const PeriodStatsModel._();

  const factory PeriodStatsModel({
    required MinMaxValuesModel thermal,
    required MinMaxValuesModel battery,
    required MinMaxValuesModel memory,
  }) = _PeriodStatsModel;

  factory PeriodStatsModel.fromJson(Map<String, dynamic> json) =>
      _$PeriodStatsModelFromJson(json);

  PeriodStats toEntity() {
    return PeriodStats(
      thermal: thermal.toEntity(),
      battery: battery.toEntity(),
      memory: memory.toEntity(),
    );
  }
}

@freezed
sealed class MinMaxValuesModel with _$MinMaxValuesModel {
  const MinMaxValuesModel._();

  const factory MinMaxValuesModel({required double min, required double max}) =
      _MinMaxValuesModel;

  factory MinMaxValuesModel.fromJson(Map<String, dynamic> json) =>
      _$MinMaxValuesModelFromJson(json);

  MinMaxValues toEntity() {
    return MinMaxValues(min: min, max: max);
  }
}

@freezed
sealed class RollingAverageModel with _$RollingAverageModel {
  const RollingAverageModel._();

  const factory RollingAverageModel({
    required double thermal,
    required double battery,
    required double memory,
  }) = _RollingAverageModel;

  factory RollingAverageModel.fromJson(Map<String, dynamic> json) =>
      _$RollingAverageModelFromJson(json);

  /// Convert to domain entity
  RollingAverage toEntity() {
    return RollingAverage(thermal: thermal, battery: battery, memory: memory);
  }
}

@freezed
sealed class TimeRangeModel with _$TimeRangeModel {
  const TimeRangeModel._();

  const factory TimeRangeModel({String? earliest, String? latest}) =
      _TimeRangeModel;

  factory TimeRangeModel.fromJson(Map<String, dynamic> json) =>
      _$TimeRangeModelFromJson(json);

  /// Convert to domain entity
  TimeRange toEntity() {
    return TimeRange(earliest: earliest, latest: latest);
  }
}
