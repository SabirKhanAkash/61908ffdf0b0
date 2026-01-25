import 'package:dvm_app/features/vitals/presentation/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';

class DVMApp extends StatelessWidget {
  const DVMApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DVM',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DashboardScreen(),
    );
  }
}
