import 'package:dartz/dartz.dart';
import 'package:dvm_app/core/errors/errors.dart';
import 'package:dvm_app/features/vitals/domain/datasources/datasources.dart';
import 'package:dvm_app/features/vitals/domain/entities/entities.dart';
import 'package:dvm_app/features/vitals/data/models/models.dart';
import 'package:dvm_app/features/vitals/domain/repositories/repositories.dart';
import 'package:flutter/services.dart';

/// Implementation of VitalRepository
class VitalRepositoryImpl implements VitalRepository {
  final VitalRemoteDataSource remoteDataSource;
  final VitalPlatformDataSource platformDataSource;

  VitalRepositoryImpl({
    required this.remoteDataSource,
    required this.platformDataSource,
  });

  // @override
  // Future<Either<Failure, SensorData>> getCurrentSensorData() async {
  //   try {
  //     final sensorData = await platformDataSource.getSensorData();
  //     return Right(sensorData.toEntity());
  //   } on PlatformException catch (e) {
  //     return Left(Failure.platform(e.message));
  //   } catch (e) {
  //     return Left(Failure.unknown('Failed to get sensor data: $e'));
  //   }
  // }

  @override
  Future<Either<Failure, void>> postVitalLog(VitalLog log) async {
    try {
      final logModel = VitalLogModel.fromEntity(log);
      await remoteDataSource.postVitalLog(logModel);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(Failure.server(e.message));
    } on NetworkException catch (e) {
      return Left(Failure.network(e.message));
    } catch (e) {
      return Left(Failure.unknown('Failed to post vital log: $e'));
    }
  }

  @override
  Future<Either<Failure, List<VitalLog>>> getVitalsHistory({
    int limit = 100,
  }) async {
    try {
      final vitals = await remoteDataSource.getVitals(limit: limit);
      // Convert models to entities
      final entities = vitals.map((model) => model.toEntity()).toList();
      return Right(entities);
    } on ServerException catch (e) {
      return Left(Failure.server(e.message));
    } on NetworkException catch (e) {
      return Left(Failure.network(e.message));
    } catch (e) {
      return Left(Failure.unknown('Failed to get vitals history: $e'));
    }
  }

  @override
  Future<Either<Failure, VitalAnalytics>> getAnalytics() async {
    try {
      final analytics = await remoteDataSource.getAnalytics();
      return Right(analytics.toEntity());
    } on ServerException catch (e) {
      return Left(Failure.server(e.message));
    } on NetworkException catch (e) {
      return Left(Failure.network(e.message));
    } catch (e) {
      return Left(Failure.unknown('Failed to get analytics: $e'));
    }
  }
}
