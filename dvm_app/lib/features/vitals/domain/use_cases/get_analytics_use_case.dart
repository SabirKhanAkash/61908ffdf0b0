import 'package:dartz/dartz.dart';
import 'package:dvm_app/core/base/bases.dart';
import 'package:dvm_app/core/errors/errors.dart';
import 'package:dvm_app/features/vitals/domain/entities/entities.dart';
import 'package:dvm_app/features/vitals/domain/repositories/repositories.dart';

class GetAnalyticsUseCase implements BaseUseCase<NoParams, VitalAnalytics> {
  final VitalRepository repository;

  GetAnalyticsUseCase(this.repository);

  @override
  Future<Either<Failure, VitalAnalytics>> call(NoParams params) async {
    return await repository.getAnalytics();
  }
}
