import 'package:dvm_app/core/errors/failures.dart';
import 'package:dvm_app/features/vitals/domain/entities/entities.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sensor_state.freezed.dart';

@freezed
sealed class SensorState with _$SensorState {
  const factory SensorState.initial() = SensorInitial;

  const factory SensorState.loading() = SensorLoading;

  const factory SensorState.success(SensorData data) = SensorSuccess;

  const factory SensorState.failure(Failure failure) = SensorFailure;
}
