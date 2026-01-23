

import 'package:dartz/dartz.dart';
import 'package:dvm_app/core/errors/errors.dart';
import 'package:dvm_app/features/vitals/domain/entities/entities.dart';

/// Abstract repository interface for Vital operations
/// This defines the contract that the data layer must implement
abstract class VitalRepository {
  /// Get current sensor data from the native platform
  /// Returns Either a Failure or SensorData
  // Future<Either<Failure, SensorData>> getCurrentSensorData();

  /// Post a vital log to the backend API
  /// Returns Either a Failure or void (success)
  Future<Either<Failure, void>> postVitalLog(VitalLog log);

  /// Get vitals history from the backend API
  /// [limit] - Number of records to fetch (default: 100)
  /// Returns Either a Failure or List of VitalLogs
  Future<Either<Failure, List<VitalLog>>> getVitalsHistory({int limit = 100});

  /// Get analytics data from the backend API
  /// Returns Either a Failure or VitalAnalytics
  Future<Either<Failure, VitalAnalytics>> getAnalytics();
}
