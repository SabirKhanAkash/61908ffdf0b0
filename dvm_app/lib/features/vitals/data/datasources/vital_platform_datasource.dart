import 'package:dvm_app/features/vitals/domain/datasources/datasources.dart';
import 'package:flutter/services.dart';

class VitalPlatformDataSourceImpl implements VitalPlatformDataSource {
  final MethodChannel methodChannel;

  VitalPlatformDataSourceImpl({MethodChannel? methodChannel})
    : methodChannel =
          methodChannel ??
          const MethodChannel(AppConstants.platformChannelName);

  @override
  Future<SensorDataModel> getSensorData() async {
    try {
      // Call native platform method
      final result = await methodChannel.invokeMethod<Map<dynamic, dynamic>>(
        AppConstants.methodGetSensorData,
      );

      if (result == null) {
        throw const PlatformException('Platform returned null data');
      }

      // Convert platform response to model
      return SensorDataModel.fromPlatform(result);
    } on PlatformException catch (e) {
      // Handle platform-specific errors
      throw PlatformException(
        'Failed to get sensor data: ${e.message ?? 'Unknown error'}',
      );
    } catch (e) {
      // Handle any other errors
      throw PlatformException('Unexpected error getting sensor data: $e');
    }
  }
}
