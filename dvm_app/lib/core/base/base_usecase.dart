import 'package:dartz/dartz.dart';
import '../errors/failures.dart';

abstract class BaseUseCase<Params, T> {
  Future<Either<Failure, T>> call(Params params);
}

class NoParams {
  const NoParams();
}
