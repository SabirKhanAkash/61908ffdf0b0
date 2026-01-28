import 'package:dvm_app/core/constants/app_constants.dart';
import 'package:dvm_app/features/vitals/data/models/models.dart';
import 'package:dvm_app/features/vitals/domain/data_sources/data_sources.dart';
import 'package:dvm_app/features/vitals/domain/entities/entities.dart';
import 'package:flutter/services.dart';

class VitalPlatformDataSourceImpl implements VitalPlatformDataSource {
  final MethodChannel methodChannel;

  VitalPlatformDataSourceImpl({MethodChannel? methodChannel})
    : methodChannel =
          methodChannel ??
          const MethodChannel(AppConstants.platformChannelName);

  @override
  Future<SensorData> getSensorData() async {
    try {
      final result = await methodChannel.invokeMethod<Map<dynamic, dynamic>>(
        AppConstants.methodGetSensorData,
      );

      if (result == null) {
        throw PlatformException(
          message: 'Platform returned null data',
          code: '',
        );
      }

      return SensorDataModel.fromPlatform(result).toEntity();
    } on PlatformException catch (e) {
      throw PlatformException(
        message: 'Failed to get sensor data: ${e.message ?? 'Unknown error'}',
        code: e.code,
      );
    } catch (e) {
      throw PlatformException(
        message: 'Unexpected error getting sensor data: $e',
        code: '',
      );
    }
  }
}
