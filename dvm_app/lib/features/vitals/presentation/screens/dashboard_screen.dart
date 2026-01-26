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
import 'package:flutter/services.dart';
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

class _DashboardView extends StatefulWidget {
  const _DashboardView();

  @override
  State<_DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<_DashboardView>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  static const int REFRESH_INTERVAL = 15;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: REFRESH_INTERVAL),
    );

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (mounted) {
          context.read<SensorCubit>().refresh();
          context.read<SensorCubit>().state.maybeWhen(
            success: (data) {
              _logCurrentStatus(context, data);
            },
            orElse: () {},
          );
          _animationController.forward(from: 0.0);
        }
      }
    });

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Device Vitals',
          style: TextStyle(fontWeight: FontWeight.w800, letterSpacing: -0.5),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                final progress = 1.0 - _animationController.value;
                final seconds = (progress * REFRESH_INTERVAL).ceil();

                return Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 28,
                      height: 28,
                      child: CircularProgressIndicator(
                        value: progress,
                        strokeWidth: 2.5,
                        backgroundColor: Colors.indigo.withValues(alpha: 0.1),
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.indigo.shade400,
                        ),
                      ),
                    ),
                    Text(
                      '$seconds',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w900,
                        color: Colors.indigo.shade600,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      body: BlocListener<VitalsCubit, VitalsState>(
        listener: (context, state) {
          state.when(
            initial: () {},
            posting: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  content: const Row(
                    children: [
                      SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.5,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Text('Recording vitals...'),
                    ],
                  ),
                  duration: const Duration(seconds: 2),
                ),
              );
            },
            posted: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  content: const Row(
                    children: [
                      Icon(Icons.check_circle_rounded, color: Colors.white),
                      SizedBox(width: 16),
                      Text('Vitals logged successfully'),
                    ],
                  ),
                  backgroundColor: Colors.green[600],
                  duration: const Duration(seconds: 2),
                ),
              );
            },
            loadingHistory: () {},
            historyLoaded: (_) {},
            error: (error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  content: Row(
                    children: [
                      const Icon(
                        Icons.error_outline_rounded,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 16),
                      Expanded(child: Text(error.message.toString())),
                    ],
                  ),
                  backgroundColor: Colors.red[600],
                  duration: const Duration(seconds: 3),
                ),
              );
            },
          );
        },
        child: RefreshIndicator(
          onRefresh: () async {
            _animationController.forward(from: 0.0);
            await context.read<SensorCubit>().refresh();
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BlocBuilder<SensorCubit, SensorState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () => const Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 40),
                          child: Text(
                            'Pull down to refresh',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                      loading: () => const Padding(
                        padding: EdgeInsets.only(top: 40),
                        child: Loader(message: 'Analyzing hardware...'),
                      ),
                      success: (SensorData data) => Column(
                        children: [
                          /// Primary: Thermal State
                          SensorCard(
                            isPrimary: true,
                            title: 'Thermal Health',
                            value: ThermalMapper.getLabel(data.thermalValue),
                            subtitle: 'Value identifier: ${data.thermalValue}',
                            icon: Icons.thermostat_rounded,
                            color: _getThermalColor(data.thermalValue),
                            onAction: () {
                              _animationController.forward(from: 0.0);
                              context.read<SensorCubit>().refresh();
                            },
                            actionIcon: Icons.refresh_rounded,
                          ),
                          const SizedBox(height: 20),

                          /// Secondary: Battery & Memory Grid
                          Row(
                            children: [
                              Expanded(
                                child: SensorCard(
                                  title: 'Battery',
                                  value:
                                      '${data.batteryLevel.toStringAsFixed(0)}%',
                                  subtitle: 'Energy',
                                  icon: Icons.bolt_rounded,
                                  color: _getBatteryColor(data.batteryLevel),
                                  progress: data.batteryLevel / 100,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: SensorCard(
                                  title: 'Memory',
                                  value:
                                      '${data.memoryUsage.toStringAsFixed(0)}%',
                                  subtitle: 'RAM Use',
                                  icon: Icons.memory_rounded,
                                  color: _getMemoryColor(data.memoryUsage),
                                  progress: data.memoryUsage / 100,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),

                          /// History & Analytics Tile
                          _buildHistoryTile(context),
                          const SizedBox(height: 32),

                          /// Action Buttons
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.green.withValues(
                                          alpha: 0.25,
                                        ),
                                        blurRadius: 15,
                                        offset: const Offset(0, 8),
                                      ),
                                    ],
                                  ),
                                  child: ElevatedButton(
                                    onPressed: () =>
                                        _logCurrentStatus(context, data),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green[600],
                                      foregroundColor: Colors.white,
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 18,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      elevation: 0,
                                    ),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.cloud_upload_rounded),
                                        SizedBox(width: 12),
                                        Text(
                                          'PERSIST LOG NOW',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            letterSpacing: 1,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
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

  void _logCurrentStatus(BuildContext context, SensorData sensorData) {
    final deviceId = _getDeviceId();

    final log = VitalLog(
      deviceId: deviceId,
      timestamp: DateTime.now().toUtc(),
      thermalValue: sensorData.thermalValue,
      batteryLevel: sensorData.batteryLevel,
      memoryUsage: sensorData.memoryUsage,
    );

    context.read<VitalsCubit>().postLog(log);
  }

  String _getDeviceId() {
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
        return Colors.green[600]!;
      case 1:
        return Colors.yellow[800]!;
      case 2:
        return Colors.orange[700]!;
      case 3:
        return Colors.red[700]!;
      default:
        return Colors.grey;
    }
  }

  Color _getBatteryColor(double batteryLevel) {
    if (batteryLevel > 60) return Colors.teal[600]!;
    if (batteryLevel > 40) return Colors.amber[700]!;
    if (batteryLevel > 20) return Colors.orange[700]!;
    return Colors.red[600]!;
  }

  Color _getMemoryColor(double memoryUsage) {
    if (memoryUsage < 60) return Colors.indigo[600]!;
    if (memoryUsage < 70) return Colors.deepPurple[600]!;
    if (memoryUsage < 80) return Colors.orange[700]!;
    return Colors.red[600]!;
  }

  Widget _buildHistoryTile(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: LinearGradient(
          colors: [
            Colors.indigo.shade800,
            const Color.fromARGB(255, 81, 174, 224),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.indigo.withValues(alpha: 0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const HistoryScreen()),
            );
          },
          borderRadius: BorderRadius.circular(28),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.analytics_rounded,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
                const SizedBox(width: 20),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'History & Analytics',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          letterSpacing: -0.5,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Deep dive into your device logs',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.white,
                  size: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
