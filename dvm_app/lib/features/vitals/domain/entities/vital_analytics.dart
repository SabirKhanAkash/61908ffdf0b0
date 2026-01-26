import 'package:freezed_annotation/freezed_annotation.dart';

part 'vital_analytics.freezed.dart';

@freezed
sealed class VitalAnalytics with _$VitalAnalytics {
  const factory VitalAnalytics({
    required RollingAverage rollingAverage,
    required MinMaxStats minMax,
    required int totalLogs,
    String? latestTimestamp,
    required int deviceCount,
    required TimeRange timeRange,
  }) = _VitalAnalytics;
}

@freezed
sealed class MinMaxStats with _$MinMaxStats {
  const factory MinMaxStats({
    required PeriodStats allTime,
    required PeriodStats lastHour,
    required PeriodStats lastDay,
    required PeriodStats lastWeek,
  }) = _MinMaxStats;
}

@freezed
sealed class PeriodStats with _$PeriodStats {
  const factory PeriodStats({
    required MinMaxValues thermal,
    required MinMaxValues battery,
    required MinMaxValues memory,
  }) = _PeriodStats;
}

@freezed
sealed class MinMaxValues with _$MinMaxValues {
  const factory MinMaxValues({required double min, required double max}) =
      _MinMaxValues;
}

@freezed
sealed class RollingAverage with _$RollingAverage {
  const factory RollingAverage({
    required double thermal,
    required double battery,
    required double memory,
  }) = _RollingAverage;
}

@freezed
sealed class TimeRange with _$TimeRange {
  const factory TimeRange({String? earliest, String? latest}) = _TimeRange;
}
