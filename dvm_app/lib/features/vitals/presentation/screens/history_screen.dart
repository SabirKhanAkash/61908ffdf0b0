import 'package:dvm_app/core/di/injection_container.dart';
import 'package:dvm_app/core/utils/utils.dart';
import 'package:dvm_app/features/vitals/domain/entities/entities.dart';
import 'package:dvm_app/features/vitals/presentation/blocs/analytics/analytics_cubit.dart';
import 'package:dvm_app/features/vitals/presentation/blocs/analytics/analytics_state.dart';
import 'package:dvm_app/features/vitals/presentation/blocs/vitals/vitals_cubit.dart';
import 'package:dvm_app/features/vitals/presentation/blocs/vitals/vitals_state.dart';
import 'package:dvm_app/features/vitals/presentation/widgets/error_display.dart';
import 'package:dvm_app/features/vitals/presentation/widgets/loader.dart';
import 'package:dvm_app/features/vitals/presentation/widgets/vital_log_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// History screen - displays logged vitals and analytics
class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<VitalsCubit>()..getHistory()),
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
        title: const Text(
          'History & Analytics',
          style: TextStyle(fontWeight: FontWeight.w600, letterSpacing: -0.5),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: RefreshIndicator(
        onRefresh: () async => await Future.wait([
          context.read<VitalsCubit>().refresh(),
          context.read<AnalyticsCubit>().refresh(),
        ]),
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
                    failure: (error) => Padding(
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
                                  'Analytics: ${error.message}',
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
                padding: const EdgeInsets.fromLTRB(20, 24, 16, 12),
                child: Row(
                  children: [
                    Container(
                      width: 4,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'Recent Logs (Last 100 Logs)',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ],
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

  Widget _buildAnalyticsCard(VitalAnalytics analytics) {
    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.analytics_rounded,
                  color: Colors.blue.shade700,
                  size: 22,
                ),
                const SizedBox(width: 12),
                const Text(
                  'Overview',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.5,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Rolling Averages
            const Text(
              'ROLLING AVERAGES',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w800,
                color: Colors.grey,
                letterSpacing: 0.8,
              ),
            ),
            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: _buildModernRollingAverageItem(
                    'Thermal',
                    analytics.rollingAverage.thermal.toStringAsFixed(1),
                    Icons.thermostat_rounded,
                    Colors.orange,
                    // Normalize thermal (assuming max is around 3 or 4 for progress indicator)
                    analytics.rollingAverage.thermal / 3,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildModernRollingAverageItem(
                    'Battery',
                    '${analytics.rollingAverage.battery.toStringAsFixed(0)}%',
                    Icons.bolt_rounded,
                    Colors.green,
                    analytics.rollingAverage.battery / 100,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildModernRollingAverageItem(
                    'Memory',
                    '${analytics.rollingAverage.memory.toStringAsFixed(0)}%',
                    Icons.memory_rounded,
                    Colors.blue,
                    analytics.rollingAverage.memory / 100,
                  ),
                ),
              ],
            ),

            const Divider(height: 32),

            // Modern Stats Grid
            Row(
              children: [
                Expanded(
                  child: _buildModernStatCard(
                    label: 'Total Logs',
                    value: analytics.totalLogs.toString(),
                    icon: Icons.analytics_rounded,
                    gradient: const LinearGradient(
                      colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _buildModernStatCard(
                    label: 'Oldest Log',
                    value: DateFormatter.format(
                      DateTime.parse(analytics.timeRange.earliest.toString()),
                    ),
                    icon: Icons.first_page_rounded,
                    gradient: LinearGradient(
                      colors: [
                        Colors.orange.shade400,
                        Colors.deepOrange.shade600,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildModernStatCard(
                    label: 'Latest Log',
                    value: DateFormatter.format(
                      DateTime.parse(analytics.timeRange.latest.toString()),
                    ),
                    icon: Icons.last_page_rounded,
                    gradient: LinearGradient(
                      colors: [Colors.teal.shade400, Colors.teal.shade700],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
              ],
            ),

            const Divider(height: 32),

            // Periodic Analysis (Min/Max)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'PERIODIC ANALYSIS',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    color: Colors.grey,
                    letterSpacing: 0.8,
                  ),
                ),
                Icon(
                  Icons.auto_graph_rounded,
                  color: Colors.indigo.shade200,
                  size: 14,
                ),
              ],
            ),
            const SizedBox(height: 16),

            DefaultTabController(
              length: 4,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.indigo.withValues(alpha: 0.05),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TabBar(
                      isScrollable: false,
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.indigo.shade400,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          colors: [
                            Colors.indigo.shade800,
                            Colors.indigo.shade600,
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.indigo.withValues(alpha: 0.3),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      indicatorSize: TabBarIndicatorSize.tab,
                      dividerColor: Colors.transparent,
                      tabs: const [
                        Tab(text: '1H'),
                        Tab(text: '24H'),
                        Tab(text: 'WEEK'),
                        Tab(text: 'ALL'),
                      ],
                      labelPadding: EdgeInsets.zero,
                      labelStyle: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 120, // Increased height for better detail
                    child: TabBarView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        _buildMinMaxRow(analytics.minMax.lastHour),
                        _buildMinMaxRow(analytics.minMax.lastDay),
                        _buildMinMaxRow(analytics.minMax.lastWeek),
                        _buildMinMaxRow(analytics.minMax.allTime),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMinMaxRow(PeriodStats stats) {
    return Row(
      children: [
        Expanded(
          child: _buildMinMaxItem('Thermal', stats.thermal, Colors.orange),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _buildMinMaxItem('Battery', stats.battery, Colors.green),
        ),
        const SizedBox(width: 8),
        Expanded(child: _buildMinMaxItem('Memory', stats.memory, Colors.blue)),
      ],
    );
  }

  Widget _buildMinMaxItem(String label, MinMaxValues values, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.03),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.08), width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label.toUpperCase(),
            style: TextStyle(
              fontSize: 8,
              fontWeight: FontWeight.w900,
              color: color.withValues(alpha: 0.5),
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildValueColumn('MIN', values.min, color),
              Container(
                width: 1,
                height: 24,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      color.withValues(alpha: 0),
                      color.withValues(alpha: 0.2),
                      color.withValues(alpha: 0),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              _buildValueColumn('MAX', values.max, color),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildValueColumn(String label, double value, Color color) {
    return Column(
      children: [
        Text(
          value.toStringAsFixed(value < 10 ? 1 : 0),
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w900,
            color: color.withValues(alpha: 0.9),
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: TextStyle(
            fontSize: 7,
            fontWeight: FontWeight.w800,
            color: Colors.grey[400],
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }

  Widget _buildModernRollingAverageItem(
    String label,
    String value,
    IconData icon,
    Color color,
    double progress,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withValues(alpha: 0.08)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 18),
          const SizedBox(height: 10),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w900,
              color: color.withValues(alpha: 0.9),
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label.toUpperCase(),
            style: TextStyle(
              fontSize: 8,
              fontWeight: FontWeight.w800,
              color: Colors.grey[500],
              letterSpacing: 0.6,
            ),
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: LinearProgressIndicator(
              value: progress.clamp(0.0, 1.0),
              backgroundColor: color.withValues(alpha: 0.1),
              valueColor: AlwaysStoppedAnimation<Color>(color),
              minHeight: 2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildModernStatCard({
    required String label,
    required String value,
    required IconData icon,
    required Gradient gradient,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: gradient.colors.first.withValues(alpha: 0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, color: Colors.white.withValues(alpha: 0.8), size: 20),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.trending_up,
                  color: Colors.white,
                  size: 12,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label.toUpperCase(),
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.7),
              fontSize: 9,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.8,
            ),
          ),
        ],
      ),
    );
  }
}
