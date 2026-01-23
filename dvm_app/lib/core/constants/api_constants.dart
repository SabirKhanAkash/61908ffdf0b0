class ApiConstants {
  static const String baseUrl = 'https://your-backend-url.vercel.app';

  // Endpoints
  static const String vitalsEndpoint = '/api/vitals';
  static const String analyticsEndpoint = '/api/vitals/analytics';

  // Timeouts
  static const Duration connectionTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
}
