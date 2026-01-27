import 'package:dvm_app/features/vitals/domain/entities/entities.dart';
import 'package:flutter/material.dart';

class RollingAveragesRow extends StatelessWidget {
  final RollingAverage rollingAverage;

  const RollingAveragesRow({super.key, required this.rollingAverage});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                rollingAverage.thermal.toStringAsFixed(1),
                Icons.thermostat_rounded,
                Colors.orange,
                // Normalize thermal (assuming max is around 3 or 4 for progress indicator)
                rollingAverage.thermal / 3,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildModernRollingAverageItem(
                'Battery',
                '${rollingAverage.battery.toStringAsFixed(0)}%',
                Icons.bolt_rounded,
                Colors.green,
                rollingAverage.battery / 100,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildModernRollingAverageItem(
                'Memory',
                '${rollingAverage.memory.toStringAsFixed(0)}%',
                Icons.memory_rounded,
                Colors.blue,
                rollingAverage.memory / 100,
              ),
            ),
          ],
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
}
