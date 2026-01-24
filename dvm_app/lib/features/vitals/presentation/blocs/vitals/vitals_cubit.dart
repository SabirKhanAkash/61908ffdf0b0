import 'package:dvm_app/features/vitals/domain/entities/entities.dart';
import 'package:dvm_app/features/vitals/domain/usecases/usecases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'vitals_state.dart';

class VitalsCubit extends Cubit<VitalsState> {
  final PostVitalLogUsecase _postVitalLog;
  final GetVitalsHistoryUsecase _getVitalsHistory;

  VitalsCubit({
    required PostVitalLogUsecase postVitalLog,
    required GetVitalsHistoryUsecase getVitalsHistory,
  }) : _postVitalLog = postVitalLog,
       _getVitalsHistory = getVitalsHistory,
       super(const VitalsState.initial());

  Future<void> postLog(VitalLog log) async {
    emit(const VitalsState.posting());

    final result = await _postVitalLog(PostVitalLogParams(log: log));

    result.fold(
      (failure) => emit(VitalsState.error(failure)),
      (_) => emit(const VitalsState.posted()),
    );
  }

  Future<void> fetchHistory({int limit = 100}) async {
    emit(const VitalsState.loadingHistory());

    final result = await _getVitalsHistory(
      GetVitalsHistoryParams(limit: limit),
    );

    result.fold(
      (failure) => emit(VitalsState.error(failure)),
      (logs) => emit(VitalsState.historyLoaded(logs)),
    );
  }

  Future<void> refresh({int limit = 100}) async {
    await fetchHistory(limit: limit);
  }

  void reset() {
    emit(const VitalsState.initial());
  }
}
