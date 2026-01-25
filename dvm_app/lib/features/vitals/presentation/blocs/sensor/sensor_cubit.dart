import 'package:dvm_app/core/base/bases.dart';
import 'package:dvm_app/features/vitals/domain/use_cases/usecases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'sensor_state.dart';

class SensorCubit extends Cubit<SensorState> {
  final GetSensorDataUseCase _useCase;

  SensorCubit({required GetSensorDataUseCase useCase})
    : _useCase = useCase,
      super(const SensorState.initial());

  Future<void> getSensorData() async {
    emit(const SensorState.loading());

    final result = await _useCase.call(NoParams());

    result.fold(
      (failure) => emit(SensorState.failure(failure)),
      (data) => emit(SensorState.success(data)),
    );
  }

  Future<void> refresh() async {
    await getSensorData();
  }

  void reset() {
    emit(const SensorState.initial());
  }
}
