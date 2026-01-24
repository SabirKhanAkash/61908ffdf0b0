import 'package:dvm_app/core/flavors/env.dart';

class AppConfig {
  static late Env _env;

  static void initialize(Env env) {
    _env = env;
  }

  static Env get env => _env;
  static String get apiBaseUrl => _env.baseUrl;
  static bool get enableLogging => _env.enableLogging;
  static String get flavorName => _env.flavorName;
  static bool get isDev => _env.isDev;
  static bool get isStage => _env.isStage;
  static bool get isProd => _env.isProd;
  static int get connectionTimeout => _env.connectionTimeout;
  static int get receiveTimeout => _env.receiveTimeout;
}