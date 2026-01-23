abstract class VitalPlatformDataSource {
  /// Get current sensor data from native platform
  Future<SensorDataModel> getSensorData();
}
