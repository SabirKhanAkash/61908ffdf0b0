import 'package:dvm_app/core/di/injection_container.dart';
import 'package:dvm_app/features/vitals/domain/entities/entities.dart';
import 'package:dvm_app/features/vitals/presentation/blocs/sensor/sensor_cubit.dart';
import 'package:dvm_app/features/vitals/presentation/blocs/sensor/sensor_state.dart';
import 'package:dvm_app/features/vitals/presentation/blocs/vitals/vitals_cubit.dart';
import 'package:dvm_app/features/vitals/presentation/blocs/vitals/vitals_state.dart';
import 'package:dvm_app/features/vitals/presentation/widgets/dashboard/dashboard_timer_action.dart';
import 'package:dvm_app/features/vitals/presentation/widgets/dashboard/history_analytics_card.dart';
import 'package:dvm_app/features/vitals/presentation/widgets/dashboard/persist_log_button.dart';
import 'package:dvm_app/features/vitals/presentation/widgets/dashboard/resource_usage_grid.dart';
import 'package:dvm_app/features/vitals/presentation/widgets/dashboard/thermal_health_card.dart';
import 'package:dvm_app/core/widgets/error_display.dart';
import 'package:dvm_app/core/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dvm_app/core/services/device_info_service.dart';

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
  static const int refreshInterval = 15;
  bool _isAutoLogEnabled = false;
  String? _deviceId;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: refreshInterval),
    );

    _initDeviceId();

    _animationController.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        if (mounted) {
          await context.read<SensorCubit>().refresh();

          if (!mounted) return;

          if (_isAutoLogEnabled) {
            context.read<SensorCubit>().state.maybeWhen(
              success: (data) => _logCurrentStatus(context, data),
              orElse: () {},
            );
          }

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
          DashboardTimerAction(
            animationController: _animationController,
            refreshInterval: refreshInterval,
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
              if (!_isAutoLogEnabled) {
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
              }
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
                          /// Auto-Log Toggle
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: _isAutoLogEnabled
                                    ? Colors.green.withValues(alpha: 0.2)
                                    : Colors.grey.withValues(alpha: 0.1),
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  _isAutoLogEnabled
                                      ? Icons.auto_mode_rounded
                                      : Icons.auto_mode_outlined,
                                  color: _isAutoLogEnabled
                                      ? Colors.green[600]
                                      : Colors.grey,
                                ),
                                const SizedBox(width: 12),
                                const Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Automatic Logging',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14,
                                        ),
                                      ),
                                      Text(
                                        'Save vitals every 15s',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Switch.adaptive(
                                  value: _isAutoLogEnabled,
                                  activeTrackColor: Colors.green[600],
                                  onChanged: (value) =>
                                      setState(() => _isAutoLogEnabled = value),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),

                          /// Primary: Thermal State
                          ThermalHealthCard(
                            data: data,
                            onRefresh: () {
                              _animationController.forward(from: 0.0);
                              context.read<SensorCubit>().refresh();
                            },
                          ),
                          const SizedBox(height: 20),

                          /// Secondary: Battery & Memory Grid
                          ResourceUsageGrid(data: data),
                          const SizedBox(height: 24),

                          /// History & Analytics Tile
                          const HistoryAnalyticsCard(),
                          const SizedBox(height: 32),

                          /// Action Buttons
                          PersistLogButton(
                            sensorData: data,
                            deviceId: _deviceId,
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

  Future<void> _initDeviceId() async {
    final deviceId = await sl<DeviceInfoService>().getDeviceId();
    if (mounted) {
      setState(() {
        _deviceId = deviceId;
      });
    }
  }

  void _logCurrentStatus(BuildContext context, SensorData sensorData) {
    if (_deviceId == null) return;

    final log = VitalLog(
      deviceId: _deviceId!,
      timestamp: DateTime.now().toUtc(),
      thermalValue: sensorData.thermalValue,
      batteryLevel: sensorData.batteryLevel,
      memoryUsage: sensorData.memoryUsage,
    );

    context.read<VitalsCubit>().postLog(log);
  }
}
