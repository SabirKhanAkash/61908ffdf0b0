import 'package:dvm_app/features/vitals/domain/entities/entities.dart';

abstract class VitalPlatformDataSource {
  /// Get current sensor data from native platform
  Future<SensorData> getSensorData();
}
