import 'package:dvm_app/app.dart';
import 'package:dvm_app/core/di/injection_container.dart';
import 'package:dvm_app/core/flavors/app_config.dart';
import 'package:dvm_app/core/flavors/env.dart';
import 'package:flutter/material.dart';

/// Main entry point for STAGE flavor
/// Run with: flutter run -t lib/main_stage.dart --flavor stage
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  AppConfig.initialize(Env.stage);

  debugPrint('🚀 Running in ${AppConfig.flavorName} mode');
  debugPrint('📡 API Base URL: ${AppConfig.apiBaseUrl}');
  debugPrint('📝 Logging enabled: ${AppConfig.enableLogging}');

  await initializeDependencies();

  runApp(const DVMApp());
}
