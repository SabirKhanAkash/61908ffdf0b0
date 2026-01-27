import 'package:dvm_app/features/vitals/domain/entities/entities.dart';
import 'package:dvm_app/core/widgets/sensor_card.dart';
import 'package:flutter/material.dart';

class ResourceUsageGrid extends StatelessWidget {
  final SensorData data;

  const ResourceUsageGrid({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SensorCard(
            title: 'Battery',
            value: '${data.batteryLevel.toStringAsFixed(0)}%',
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
            value: '${data.memoryUsage.toStringAsFixed(0)}%',
            subtitle: 'RAM Use',
            icon: Icons.memory_rounded,
            color: _getMemoryColor(data.memoryUsage),
            progress: data.memoryUsage / 100,
          ),
        ),
      ],
    );
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
}
