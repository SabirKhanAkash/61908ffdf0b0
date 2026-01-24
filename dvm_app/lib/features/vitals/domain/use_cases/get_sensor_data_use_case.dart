import 'package:dartz/dartz.dart';
import 'package:dvm_app/core/base/bases.dart';
import 'package:dvm_app/core/errors/errors.dart';
import 'package:dvm_app/features/vitals/domain/entities/entities.dart';
import 'package:dvm_app/features/vitals/domain/repositories/repositories.dart';

class GetSensorDataUseCase implements BaseUseCase<NoParams, SensorData> {
  final VitalRepository repository;

  GetSensorDataUseCase(this.repository);

  @override
  Future<Either<Failure, SensorData>> call(NoParams params) async {
    return await repository.getCurrentSensorData();
  }
}
