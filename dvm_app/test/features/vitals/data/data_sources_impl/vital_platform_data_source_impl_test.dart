import 'package:dvm_app/core/constants/app_constants.dart';
import 'package:dvm_app/features/vitals/data/data_sources_impl/vital_platform_data_source_impl.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late VitalPlatformDataSourceImpl dataSource;
  late MethodChannel mockChannel;

  setUp(() {
    // We can't easily mock the default MethodChannel constructor's internal binary messenger
    // without using setMockMethodCallHandler on the channel itself,
    // OR passing a mock/stub method channel if dependency injection allowed it.
    // The implementation allows passing a method channel.

    // However, since we want to test the interaction, we can explicitly pass a method channel
    // that we can control or use the standard flutter test binding.

    // Let's use the standard Flutter testing way for method channels.
    mockChannel = const MethodChannel(AppConstants.platformChannelName);
    dataSource = VitalPlatformDataSourceImpl(methodChannel: mockChannel);
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(mockChannel, (MethodCall methodCall) async {
          if (methodCall.method == 'getSensorData') {
            return {
              'thermal_value': 1,
              'battery_level': 85.0,
              'memory_usage': 45.0,
            };
          }
          return null;
        });
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(mockChannel, null);
  });

  group('getAndroidSensorData', () {
    test('should return SensorData when platform call is successful', () async {
      // act
      final result = await dataSource.getAndroidSensorData();

      // assert
      expect(result.thermalValue, 1);
      expect(result.batteryLevel, 85.0);
      expect(result.memoryUsage, 45.0);
    });

    test('should throw PlatformException when platform returns null', () async {
      // arrange
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(mockChannel, (MethodCall methodCall) async {
            return null;
          });

      // act
      final call = dataSource.getAndroidSensorData;

      // assert
      expect(() => call(), throwsA(isA<PlatformException>()));
    });

    test(
      'should throw PlatformException when platform throws PlatformException',
      () async {
        // arrange
        TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
            .setMockMethodCallHandler(mockChannel, (
              MethodCall methodCall,
            ) async {
              throw PlatformException(code: 'ERROR', message: 'Some error');
            });

        // act
        final call = dataSource.getAndroidSensorData;

        // assert
        expect(() => call(), throwsA(isA<PlatformException>()));
      },
    );
  });
}
