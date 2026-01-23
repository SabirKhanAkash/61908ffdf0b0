/// Application wide constants
class AppConstants {
  // Platform Channel
  static const String platformChannelName = 'com.example.vitals/sensors';

  // Method Channel Methods
  static const String methodGetSensorData = 'getSensorData';

  // Sensor value ranges
  static const int thermalMin = 0;
  static const int thermalMax = 3;
  static const double batteryMin = 0.0;
  static const double batteryMax = 100.0;
  static const double memoryMin = 0.0;
  static const double memoryMax = 100.0;

  // UI
  static const int defaultHistoryLimit = 100;

  // Refresh intervals
  static const Duration sensorRefreshInterval = Duration(seconds: 5);
}
