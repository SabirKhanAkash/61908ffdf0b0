import 'package:dvm_app/core/di/injection_container.dart';
import 'package:dvm_app/features/vitals/presentation/blocs/analytics/analytics_cubit.dart';
import 'package:dvm_app/features/vitals/presentation/blocs/analytics/analytics_state.dart';
import 'package:dvm_app/features/vitals/presentation/blocs/vitals/vitals_cubit.dart';
import 'package:dvm_app/features/vitals/presentation/blocs/vitals/vitals_state.dart';
import 'package:dvm_app/features/vitals/presentation/widgets/error_display.dart';
import 'package:dvm_app/features/vitals/presentation/widgets/loader.dart';
import 'package:dvm_app/features/vitals/presentation/widgets/vital_log_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// History screen - displays logged vitals and analytics
class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<VitalsCubit>()..fetchHistory()),
        BlocProvider(create: (_) => sl<AnalyticsCubit>()..getAnalytics()),
      ],
      child: const _HistoryView(),
    );
  }
}

class _HistoryView extends StatelessWidget {
  const _HistoryView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History & Analytics'),
        centerTitle: true,
        elevation: 0,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.wait([
            context.read<VitalsCubit>().refresh(),
            context.read<AnalyticsCubit>().refresh(),
          ]);
        },
        child: CustomScrollView(
          slivers: [
            // Analytics Section
            SliverToBoxAdapter(
              child: BlocBuilder<AnalyticsCubit, AnalyticsState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => const SizedBox.shrink(),
                    loading: () => const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Loader(message: 'Loading analytics...'),
                    ),
                    success: (analytics) => _buildAnalyticsCard(analytics),
                    failure: (message) => Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Card(
                        color: Colors.red[50],
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Icon(Icons.warning, color: Colors.red[700]),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  'Analytics: $message',
                                  style: TextStyle(color: Colors.red[700]),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // History Header
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Text(
                  'Recent Logs',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ),

            // History List
            BlocBuilder<VitalsCubit, VitalsState>(
              builder: (context, state) {
                return state.when(
                  initial: () => const SliverFillRemaining(
                    child: Center(child: Text('No data')),
                  ),
                  posting: () => const SliverFillRemaining(child: Loader()),
                  posted: () => const SliverFillRemaining(child: Loader()),
                  loadingHistory: () => const SliverFillRemaining(
                    child: Loader(message: 'Loading history...'),
                  ),
                  historyLoaded: (logs) {
                    if (logs.isEmpty) {
                      return const SliverFillRemaining(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.inbox, size: 64, color: Colors.grey),
                              SizedBox(height: 16),
                              Text(
                                'No logs yet',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Log your first status from the dashboard',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      );
                    }

                    return SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        final log = logs[index];
                        return VitalLogTile(log: log);
                      }, childCount: logs.length),
                    );
                  },
                  error: (failure) => SliverFillRemaining(
                    child: ErrorDisplay(
                      message: failure.message.toString(),
                      onRetry: () {
                        context.read<VitalsCubit>().refresh();
                      },
                    ),
                  ),
                );
              },
            ),

            // Bottom padding
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
          ],
        ),
      ),
    );
  }

  Widget _buildAnalyticsCard(dynamic analytics) {
    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.analytics, color: Colors.blue),
                SizedBox(width: 12),
                Text(
                  'Analytics',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Rolling Averages
            const Text(
              'Rolling Averages (Last 100 logs)',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: _buildAnalyticsItem(
                    'Thermal',
                    analytics.rollingAverage.thermal.toStringAsFixed(2),
                    Icons.thermostat,
                    Colors.orange,
                  ),
                ),
                Expanded(
                  child: _buildAnalyticsItem(
                    'Battery',
                    '${analytics.rollingAverage.battery.toStringAsFixed(1)}%',
                    Icons.battery_full,
                    Colors.green,
                  ),
                ),
                Expanded(
                  child: _buildAnalyticsItem(
                    'Memory',
                    '${analytics.rollingAverage.memory.toStringAsFixed(1)}%',
                    Icons.memory,
                    Colors.blue,
                  ),
                ),
              ],
            ),

            const Divider(height: 32),

            // Stats
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatItem(
                  'Total Logs',
                  analytics.totalLogs.toString(),
                  Icons.receipt_long,
                ),
                _buildStatItem(
                  'Devices',
                  analytics.deviceCount.toString(),
                  Icons.devices,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnalyticsItem(
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    return Column(
      children: [
        Icon(icon, color: color, size: 24),
        const SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }

  Widget _buildStatItem(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Colors.grey[600]),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
      ],
    );
  }
}
