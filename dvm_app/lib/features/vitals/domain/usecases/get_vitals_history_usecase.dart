import 'package:dartz/dartz.dart';
import 'package:dvm_app/core/base/bases.dart';
import 'package:dvm_app/core/errors/errors.dart';
import 'package:dvm_app/features/vitals/domain/entities/entities.dart';
import 'package:dvm_app/features/vitals/domain/repositories/repositories.dart';

class GetVitalsHistoryUsecase
    implements BaseUseCase<GetVitalsHistoryParams, List<VitalLog>> {
  final VitalRepository repository;

  GetVitalsHistoryUsecase(this.repository);

  @override
  Future<Either<Failure, List<VitalLog>>> call(
    GetVitalsHistoryParams params,
  ) async {
    return await repository.getVitalsHistory(limit: params.limit);
  }
}

class GetVitalsHistoryParams {
  final int limit;

  const GetVitalsHistoryParams({this.limit = 100});
}
