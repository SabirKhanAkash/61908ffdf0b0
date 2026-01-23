import 'package:freezed_annotation/freezed_annotation.dart';

part 'vital_analytics.freezed.dart';

@freezed
sealed class VitalAnalytics with _$VitalAnalytics {
  const factory VitalAnalytics({
    required RollingAverage rollingAverage,
    required int totalLogs,
    String? latestTimestamp,
    required int deviceCount,
    required TimeRange timeRange,
  }) = _VitalAnalytics;
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
