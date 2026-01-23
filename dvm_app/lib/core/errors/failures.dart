import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

/// Base class for all failures using Freezed union types
@freezed
sealed class Failure with _$Failure {
  const factory Failure.server([String? message]) = ServerFailure;
  const factory Failure.network([String? message]) = NetworkFailure;
  const factory Failure.platform([String? message]) = PlatformFailure;
  const factory Failure.validation(String message) = ValidationFailure;
  const factory Failure.unknown([String? message]) = UnknownFailure;
}

// Extension to get error message
extension FailureX on Failure {
  String get message => when(
    server: (msg) => msg ?? 'Server error occurred',
    network: (msg) => msg ?? 'No internet connection',
    platform: (msg) => msg ?? 'Platform error occurred',
    validation: (msg) => msg,
    unknown: (msg) => msg ?? 'An unknown error occurred',
  );
}
