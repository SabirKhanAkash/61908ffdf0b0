import 'package:dartz/dartz.dart';
import 'package:dvm_app/core/base/bases.dart';
import 'package:dvm_app/core/errors/errors.dart';
import 'package:dvm_app/features/vitals/domain/entities/entities.dart';
import 'package:dvm_app/features/vitals/domain/repositories/repositories.dart';

class PostVitalLogUseCase implements BaseUseCase<PostVitalLogParams, void> {
  final VitalRepository repository;

  PostVitalLogUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(PostVitalLogParams params) async {
    return await repository.postVitalLog(params.log);
  }
}

class PostVitalLogParams {
  final VitalLog log;

  const PostVitalLogParams({required this.log});
}
