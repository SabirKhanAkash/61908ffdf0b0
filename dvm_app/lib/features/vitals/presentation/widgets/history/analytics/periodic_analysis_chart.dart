import 'package:dvm_app/features/vitals/domain/entities/entities.dart';

import 'package:flutter/material.dart';

class PeriodicAnalysisChart extends StatelessWidget {
  final MinMaxStats minMax;

  const PeriodicAnalysisChart({super.key, required this.minMax});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                      colors: [Colors.indigo.shade800, Colors.indigo.shade600],
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
                    _buildMinMaxRow(minMax.lastHour),
                    _buildMinMaxRow(minMax.lastDay),
                    _buildMinMaxRow(minMax.lastWeek),
                    _buildMinMaxRow(minMax.allTime),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
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
}
