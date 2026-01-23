import 'package:dvm_app/features/vitals/data/models/models.dart';

abstract class VitalPlatformDataSource {
  /// Get current sensor data from native platform
  Future<SensorDataModel> getSensorData();
}
