import 'package:dartz/dartz.dart';
import 'package:dvm_app/core/errors/errors.dart';
import 'package:dvm_app/features/vitals/domain/entities/entities.dart';

abstract class VitalRepository {
  Future<Either<Failure, SensorData>> getCurrentSensorData();

  Future<Either<Failure, void>> postVitalLog(VitalLog log);

  Future<Either<Failure, List<VitalLog>>> getVitalsHistory({int limit = 100});

  Future<Either<Failure, VitalAnalytics>> getAnalytics();
}
