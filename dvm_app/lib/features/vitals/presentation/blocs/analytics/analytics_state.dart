import 'package:dvm_app/core/errors/errors.dart';
import 'package:dvm_app/features/vitals/domain/entities/entities.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'analytics_state.freezed.dart';

@freezed
sealed class AnalyticsState with _$AnalyticsState {
  const factory AnalyticsState.initial() = AnalyticsInitial;

  const factory AnalyticsState.loading() = AnalyticsLoading;

  const factory AnalyticsState.success(VitalAnalytics analytics) = AnalyticsSuccess;

  const factory AnalyticsState.failure(Failure failure) = AnalyticsFailure;
}