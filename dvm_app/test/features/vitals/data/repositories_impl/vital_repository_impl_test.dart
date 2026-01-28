import 'package:dartz/dartz.dart';
import 'package:dvm_app/core/errors/errors.dart';
import 'package:dvm_app/features/vitals/data/repositories_impl/vital_repository_impl.dart';
import 'package:dvm_app/features/vitals/domain/data_sources/data_sources.dart';
import 'package:dvm_app/features/vitals/domain/entities/entities.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockVitalRemoteDataSource extends Mock implements VitalRemoteDataSource {}

class MockVitalPlatformDataSource extends Mock
    implements VitalPlatformDataSource {}

void main() {
  late VitalRepositoryImpl repository;
  late MockVitalRemoteDataSource mockRemoteDataSource;
  late MockVitalPlatformDataSource mockPlatformDataSource;

  setUpAll(() {
    registerFallbackValue(VitalLog(timestamp: DateTime.now()));
  });

  setUp(() {
    mockRemoteDataSource = MockVitalRemoteDataSource();
    mockPlatformDataSource = MockVitalPlatformDataSource();
    repository = VitalRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      platformDataSource: mockPlatformDataSource,
    );
  });

  final tTimestamp = DateTime(2023, 1, 1);
  final tSensorData = SensorData(
    thermalValue: 0,
    batteryLevel: 80.0,
    memoryUsage: 40.0,
    timestamp: tTimestamp,
  );

  final tVitalLog = VitalLog(
    id: 1,
    deviceId: 'device1',
    timestamp: tTimestamp,
    thermalValue: 0,
    batteryLevel: 80.0,
    memoryUsage: 40.0,
  );

  final tVitalAnalytics = VitalAnalytics(
    rollingAverage: const RollingAverage(thermal: 0, battery: 80, memory: 40),
    minMax: const MinMaxStats(
      allTime: PeriodStats(
        thermal: MinMaxValues(min: 0, max: 0),
        battery: MinMaxValues(min: 80, max: 80),
        memory: MinMaxValues(min: 40, max: 40),
      ),
      lastHour: PeriodStats(
        thermal: MinMaxValues(min: 0, max: 0),
        battery: MinMaxValues(min: 80, max: 80),
        memory: MinMaxValues(min: 40, max: 40),
      ),
      lastDay: PeriodStats(
        thermal: MinMaxValues(min: 0, max: 0),
        battery: MinMaxValues(min: 80, max: 80),
        memory: MinMaxValues(min: 40, max: 40),
      ),
      lastWeek: PeriodStats(
        thermal: MinMaxValues(min: 0, max: 0),
        battery: MinMaxValues(min: 80, max: 80),
        memory: MinMaxValues(min: 40, max: 40),
      ),
    ),
    totalLogs: 1,
    deviceCount: 1,
    timeRange: const TimeRange(earliest: '2023-01-01', latest: '2023-01-01'),
  );

  group('getCurrentSensorData', () {
    test(
      'should return SensorData when platformDataSource call is successful',
      () async {
        // arrange
        when(
          () => mockPlatformDataSource.getSensorData(),
        ).thenAnswer((_) async => tSensorData);

        // act
        final result = await repository.getCurrentSensorData();

        // assert
        expect(result.isRight(), true);
        expect(result.getOrElse(() => throw Exception()), tSensorData);
      },
    );

    test('should return Failure when platformDataSource call fails', () async {
      // arrange
      when(
        () => mockPlatformDataSource.getSensorData(),
      ).thenThrow(Exception('Platform error'));

      // act
      final result = await repository.getCurrentSensorData();

      // assert
      expect(result.isLeft(), true);
    });
  });

  group('postVitalLog', () {
    test(
      'should return null when remoteDataSource call is successful',
      () async {
        // arrange
        when(
          () => mockRemoteDataSource.postVitalLog(any()),
        ).thenAnswer((_) async => Future.value());

        // act
        final result = await repository.postVitalLog(tVitalLog);

        // assert
        expect(result, const Right(null));
        verify(() => mockRemoteDataSource.postVitalLog(tVitalLog));
      },
    );

    test('should return failure when remoteDataSource call fails', () async {
      // arrange
      when(
        () => mockRemoteDataSource.postVitalLog(any()),
      ).thenThrow(const ServerException('Server error'));

      // act
      final result = await repository.postVitalLog(tVitalLog);

      // assert
      expect(result, equals(const Left(Failure.server('Server error'))));
    });
  });

  group('getVitalsHistory', () {
    test(
      'should return list of VitalLog when remoteDataSource call is successful',
      () async {
        // arrange
        final tList = [tVitalLog];
        when(
          () => mockRemoteDataSource.getVitals(limit: any(named: 'limit')),
        ).thenAnswer((_) async => tList);

        // act
        final result = await repository.getVitalsHistory(limit: 10);

        // assert
        expect(result.isRight(), true);
        final list = result.getOrElse(() => []);
        expect(list.length, 1);
        expect(list.first, tVitalLog);
        verify(() => mockRemoteDataSource.getVitals(limit: 10));
      },
    );
  });

  group('getAnalytics', () {
    test(
      'should return VitalAnalytics when remoteDataSource call is successful',
      () async {
        // arrange
        when(
          () => mockRemoteDataSource.getAnalytics(),
        ).thenAnswer((_) async => tVitalAnalytics);

        // act
        final result = await repository.getAnalytics();

        // assert
        expect(result.isRight(), true);
        expect(result.getOrElse(() => throw Exception()), tVitalAnalytics);
        verify(() => mockRemoteDataSource.getAnalytics());
      },
    );
  });
}
