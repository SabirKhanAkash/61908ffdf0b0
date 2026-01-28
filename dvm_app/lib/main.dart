import 'package:dvm_app/app.dart';
import 'package:dvm_app/core/di/injection_container.dart';
import 'package:dvm_app/core/flavors/app_config.dart';
import 'package:dvm_app/core/flavors/env.dart';
import 'package:flutter/material.dart';

/// default app entry point
/// Run with: flutter run -t lib/main.dart --flavor prod
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  AppConfig.initialize(Env.prod);

  debugPrint('Running in Production mode');

  await initializeDependencies();

  runApp(const DVMApp());
}
