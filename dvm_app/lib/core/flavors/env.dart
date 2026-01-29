class Env {
  final String flavorName;
  final String baseUrl;
  final bool enableLogging;
  final int connectionTimeout;
  final int receiveTimeout;

  const Env({
    required this.flavorName,
    required this.baseUrl,
    required this.enableLogging,
    required this.connectionTimeout,
    required this.receiveTimeout,
  });

  static const dev = Env(
    flavorName: 'dev',
    // baseUrl: 'http://127.0.0.1:3000',  /// <-- change this baseUrl to your machine's local IP
    baseUrl: 'http://192.168.0.164:3000',  /// <-- change this baseUrl to your machine's local IP
    enableLogging: true,
    connectionTimeout: 10,
    receiveTimeout: 10,
  );

  static const stage = Env(
    flavorName: 'stage',
    baseUrl: 'https://61908ffdf0b0-qf8sf9b29-sabir-khan-akashs-projects.vercel.app',
    enableLogging: true,
    connectionTimeout: 7,
    receiveTimeout: 7,
  );

  static const prod = Env(
    flavorName: 'prod',
    baseUrl: 'https://61908ffdf0b0-sabir-khan-akashs-projects.vercel.app',
    enableLogging: false,
    connectionTimeout: 5,
    receiveTimeout: 5,
  );

  bool get isDev => flavorName == 'dev';
  bool get isStage => flavorName == 'stage';
  bool get isProd => flavorName == 'prod';
}
