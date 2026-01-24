import 'package:dvm_app/core/flavors/app_config.dart';

class ApiConstants {
  static String baseUrl = AppConfig.apiBaseUrl;

  // Endpoints
  static const String vitalsEndpoint = '/api/vitals';
  static const String analyticsEndpoint = '/api/vitals/analytics';

  // Timeouts
  static Duration connectionTimeout = Duration(
    seconds: AppConfig.connectionTimeout,
  );
  static Duration receiveTimeout = Duration(seconds: AppConfig.receiveTimeout);
}
