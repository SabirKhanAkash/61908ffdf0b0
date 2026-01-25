import 'package:dvm_app/features/vitals/domain/entities/entities.dart';

abstract class VitalPlatformDataSource {
  Future<SensorData> getAndroidSensorData();

  Future<SensorData> getIOSSensorData();
}
