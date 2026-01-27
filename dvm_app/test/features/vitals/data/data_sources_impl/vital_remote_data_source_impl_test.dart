import 'dart:convert';
import 'package:dvm_app/core/constants/api_constants.dart';
import 'package:dvm_app/core/errors/errors.dart';
import 'package:dvm_app/features/vitals/data/data_sources_impl/vital_remote_data_source_impl.dart';
import 'package:dvm_app/features/vitals/data/models/models.dart';
import 'package:dvm_app/features/vitals/domain/entities/entities.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

import 'package:dvm_app/core/flavors/app_config.dart';
import 'package:dvm_app/core/flavors/env.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late VitalRemoteDataSourceImpl dataSource;
  late MockHttpClient mockHttpClient;

  setUpAll(() {
    AppConfig.initialize(
      const Env(
        flavorName: 'test',
        baseUrl: 'http://test',
        enableLogging: false,
        connectionTimeout: 1,
        receiveTimeout: 1,
      ),
    );
    registerFallbackValue(Uri.parse('http://example.com'));
  });

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = VitalRemoteDataSourceImpl(client: mockHttpClient);
  });

  final tVitalLog = VitalLog(
    id: 1,
    deviceId: 'test_device',
    timestamp: DateTime.parse('2023-01-01T00:00:00Z'),
    thermalValue: 0,
    batteryLevel: 80.0,
    memoryUsage: 40.0,
  );

  // We need a model for JSON comparison as well, matching the entity
  final tVitalLogModel = VitalLogModel(
    id: 1,
    deviceId: 'test_device',
    timestamp: DateTime.parse('2023-01-01T00:00:00Z'),
    thermalValue: 0,
    batteryLevel: 80.0,
    memoryUsage: 40.0,
  );

  group('postVitalLog', () {
    test('should perform a POST request on a URL with log body', () async {
      // arrange
      when(
        () => mockHttpClient.post(
          any(),
          headers: any(named: 'headers'),
          body: any(named: 'body'),
        ),
      ).thenAnswer((_) async => http.Response('{"message": "success"}', 201));

      // act
      await dataSource.postVitalLog(tVitalLog);

      // assert
      verify(
        () => mockHttpClient.post(
          Uri.parse('${ApiConstants.baseUrl}${ApiConstants.vitalsEndpoint}'),
          headers: {'Content-Type': 'application/json'},
          body: json.encode(tVitalLogModel.toJson()),
        ),
      );
    });

    test(
      'should throw ServerException when the response code is 500',
      () async {
        // arrange
        when(
          () => mockHttpClient.post(
            any(),
            headers: any(named: 'headers'),
            body: any(named: 'body'),
          ),
        ).thenAnswer((_) async => http.Response('Something went wrong', 500));

        // act
        final call = dataSource.postVitalLog;

        // assert
        expect(() => call(tVitalLog), throwsA(isA<ServerException>()));
      },
    );
  });

  group('getVitals', () {
    final tVitalLogList = [tVitalLog];

    test(
      'should return list of VitalLog when the response code is 200',
      () async {
        // arrange
        when(
          () => mockHttpClient.get(any(), headers: any(named: 'headers')),
        ).thenAnswer(
          (_) async => http.Response(
            json.encode({
              "data": [tVitalLogModel.toJson()],
            }),
            200,
          ),
        );

        // act
        final result = await dataSource.getVitals();

        // assert
        expect(result, equals(tVitalLogList));
      },
    );

    test(
      'should throw ServerException when the response code is 404',
      () async {
        // arrange
        when(
          () => mockHttpClient.get(any(), headers: any(named: 'headers')),
        ).thenAnswer((_) async => http.Response('Not Found', 404));

        // act
        final call = dataSource.getVitals;

        // assert
        expect(() => call(), throwsA(isA<ServerException>()));
      },
    );
  });
}
