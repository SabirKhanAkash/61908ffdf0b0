import 'package:dvm_app/features/vitals/domain/entities/entities.dart';
import 'package:dvm_app/features/vitals/presentation/widgets/history/analytics/periodic_analysis_chart.dart';
import 'package:dvm_app/features/vitals/presentation/widgets/history/analytics/rolling_averages_row.dart';
import 'package:dvm_app/features/vitals/presentation/widgets/history/analytics/stats_grid.dart';
import 'package:flutter/material.dart';

class AnalyticsOverviewCard extends StatelessWidget {
  final VitalAnalytics analytics;

  const AnalyticsOverviewCard({super.key, required this.analytics});

  @override
  Widget build(BuildContext context) {
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
            RollingAveragesRow(rollingAverage: analytics.rollingAverage),

            const Divider(height: 32),

            // Modern Stats Grid
            StatsGrid(analytics: analytics),

            const Divider(height: 32),

            // Periodic Analysis (Min/Max)
            PeriodicAnalysisChart(minMax: analytics.minMax),
          ],
        ),
      ),
    );
  }
}
