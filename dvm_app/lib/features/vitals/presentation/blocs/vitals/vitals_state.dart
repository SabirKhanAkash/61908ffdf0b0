import 'package:dvm_app/core/errors/failures.dart';
import 'package:dvm_app/features/vitals/domain/entities/entities.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vitals_state.freezed.dart';

@freezed
sealed class VitalsState with _$VitalsState {
  const factory VitalsState.initial() = VitalsInitial;

  const factory VitalsState.posting() = VitalsPosting;

  const factory VitalsState.posted() = VitalsPosted;

  const factory VitalsState.loadingHistory() = VitalsLoadingHistory;

  const factory VitalsState.historyLoaded(List<VitalLog> logs) =
      VitalsHistoryLoaded;

  const factory VitalsState.error(Failure failure) = VitalsError;
}
