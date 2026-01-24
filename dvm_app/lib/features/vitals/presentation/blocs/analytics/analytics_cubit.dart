import 'package:dvm_app/core/base/bases.dart';
import 'package:dvm_app/features/vitals/domain/use_cases/usecases.dart';
import 'package:dvm_app/features/vitals/presentation/blocs/analytics/analytics_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnalyticsCubit extends Cubit<AnalyticsState> {
  final GetAnalyticsUseCase _usecase;

  AnalyticsCubit({required GetAnalyticsUseCase usecase})
    : _usecase = usecase,
      super(const AnalyticsState.initial());

  Future<void> getAnalytics() async {
    emit(const AnalyticsState.loading());
    final result = await _usecase.call(NoParams());
    result.fold(
      (failure) => emit(AnalyticsState.failure(failure)),
      (analytics) => emit(AnalyticsState.success(analytics)),
    );
  }

  Future<void> refresh() async {
    await getAnalytics();
  }

  void reset() {
    emit(const AnalyticsState.initial());
  }
}
