import 'dart:io';
import 'package:dvm_app/core/di/injection_container.dart';
import 'package:dvm_app/core/utils/thermal_mapper.dart';
import 'package:dvm_app/features/vitals/domain/entities/entities.dart';
import 'package:dvm_app/features/vitals/presentation/blocs/sensor/sensor_cubit.dart';
import 'package:dvm_app/features/vitals/presentation/blocs/sensor/sensor_state.dart';
import 'package:dvm_app/features/vitals/presentation/blocs/vitals/vitals_cubit.dart';
import 'package:dvm_app/features/vitals/presentation/blocs/vitals/vitals_state.dart';
import 'package:dvm_app/features/vitals/presentation/widgets/error_display.dart';
import 'package:dvm_app/features/vitals/presentation/widgets/loader.dart';
import 'package:dvm_app/features/vitals/presentation/widgets/sensor_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'history_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<SensorCubit>()..getSensorData()),
        BlocProvider(create: (_) => sl<VitalsCubit>()),
      ],
      child: const _DashboardView(),
    );
  }
}

class _DashboardView extends StatelessWidget {
  const _DashboardView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Device Vitals Monitor'),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            tooltip: 'View History',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const HistoryScreen()),
              );
            },
          ),
        ],
      ),
      body: BlocListener<VitalsCubit, VitalsState>(
        listener: (context, state) {
          state.when(
            initial: () {},
            posting: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Row(
                    children: [
                      SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                      SizedBox(width: 16),
                      Text('Logging vitals...'),
                    ],
                  ),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            posted: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Row(
                    children: [
                      Icon(Icons.check_circle, color: Colors.white),
                      SizedBox(width: 16),
                      Text('Vitals logged successfully!'),
                    ],
                  ),
                  backgroundColor: Colors.green,
                  duration: Duration(seconds: 2),
                ),
              );
            },
            loadingHistory: () {},
            historyLoaded: (_) {},
            error: (error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Row(
                    children: [
                      const Icon(Icons.error, color: Colors.white),
                      const SizedBox(width: 16),
                      Expanded(child: Text(error.message.toString())),
                    ],
                  ),
                  backgroundColor: Colors.red,
                  duration: const Duration(seconds: 3),
                ),
              );
            },
          );
        },
        child: RefreshIndicator(
          onRefresh: () async => await context.read<SensorCubit>().refresh(),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Sensor Data Section
                BlocBuilder<SensorCubit, SensorState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () =>
                          const Center(child: Text('Pull down to refresh')),
                      loading: () =>
                          const Loader(message: 'Fetching sensor data...'),
                      success: (data) => Column(
                        children: [
                          SensorCard(
                            title: 'Thermal State',
                            value: data.thermalValue.toString(),
                            subtitle: ThermalMapper.getLabel(data.thermalValue),
                            icon: Icons.thermostat,
                            color: _getThermalColor(data.thermalValue),
                          ),
                          const SizedBox(height: 16),

                          // Battery Level
                          SensorCard(
                            title: 'Battery Level',
                            value: '${data.batteryLevel.toStringAsFixed(0)}%',
                            subtitle: 'Remaining charge',
                            icon: Icons.battery_full,
                            color: _getBatteryColor(data.batteryLevel),
                          ),
                          const SizedBox(height: 16),

                          // Memory Usage
                          SensorCard(
                            title: 'Memory Usage',
                            value: '${data.memoryUsage.toStringAsFixed(0)}%',
                            subtitle: 'RAM in use',
                            icon: Icons.memory,
                            color: _getMemoryColor(data.memoryUsage),
                          ),
                          const SizedBox(height: 24),

                          // Action Buttons
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    context.read<SensorCubit>().refresh();
                                  },
                                  icon: const Icon(Icons.refresh),
                                  label: const Text('Refresh'),
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.all(16),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    _logCurrentStatus(context, data);
                                  },
                                  icon: const Icon(Icons.upload),
                                  label: const Text('Log Status'),
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.all(16),
                                    backgroundColor: Colors.green,
                                    foregroundColor: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      failure: (failure) => ErrorDisplay(
                        message: failure.message.toString(),
                        onRetry: () {
                          context.read<SensorCubit>().refresh();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _logCurrentStatus(BuildContext context, dynamic sensorData) {
    // Get device ID
    final deviceId = _getDeviceId();

    // Create vital log
    final log = VitalLog(
      deviceId: deviceId,
      timestamp: DateTime.now(),
      thermalValue: sensorData.thermalValue,
      batteryLevel: sensorData.batteryLevel,
      memoryUsage: sensorData.memoryUsage,
    );

    // Post to backend
    context.read<VitalsCubit>().postLog(log);
  }

  String _getDeviceId() {
    // Use platform-specific device identifier
    // For demo purposes, using a simple identifier
    if (Platform.isAndroid) {
      return 'android-${DateTime.now().millisecondsSinceEpoch}';
    } else if (Platform.isIOS) {
      return 'ios-${DateTime.now().millisecondsSinceEpoch}';
    } else {
      return 'unknown-${DateTime.now().millisecondsSinceEpoch}';
    }
  }

  Color _getThermalColor(int thermalValue) {
    switch (thermalValue) {
      case 0:
        return Colors.green;
      case 1:
        return Colors.yellow[700]!;
      case 2:
        return Colors.orange;
      case 3:
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  Color _getBatteryColor(double batteryLevel) {
    if (batteryLevel > 60) return Colors.green;
    if (batteryLevel > 20) return Colors.orange;
    return Colors.red;
  }

  Color _getMemoryColor(double memoryUsage) {
    if (memoryUsage < 60) return Colors.green;
    if (memoryUsage < 80) return Colors.orange;
    return Colors.red;
  }
}
