import 'package:dvm_app/core/utils/utils.dart';
import 'package:dvm_app/features/vitals/domain/entities/entities.dart';
import 'package:flutter/material.dart';

class VitalLogTile extends StatelessWidget {
  final VitalLog log;

  const VitalLogTile({super.key, required this.log});

  @override
  Widget build(BuildContext context) {
    final thermalColor = _getThermalColor(log.thermalValue);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with timestamp
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DateFormatter.format(log.timestamp),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  DateFormatter.getRelativeTime(log.timestamp),
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Sensor values
            Row(
              children: [
                // Thermal
                Expanded(
                  child: _buildSensorInfo(
                    'Thermal',
                    ThermalMapper.getLabel(log.thermalValue),
                    thermalColor,
                    Icons.thermostat,
                  ),
                ),

                // Battery
                Expanded(
                  child: _buildSensorInfo(
                    'Battery',
                    '${log.batteryLevel.toStringAsFixed(0)}%',
                    _getBatteryColor(log.batteryLevel),
                    Icons.battery_full,
                  ),
                ),

                // Memory
                Expanded(
                  child: _buildSensorInfo(
                    'Memory',
                    '${log.memoryUsage.toStringAsFixed(0)}%',
                    _getMemoryColor(log.memoryUsage),
                    Icons.memory,
                  ),
                ),
              ],
            ),

            // Device ID
            if (log.deviceId.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text(
                'Device: ${log.deviceId}',
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildSensorInfo(
    String label,
    String value,
    Color color,
    IconData icon,
  ) {
    return Column(
      children: [
        Icon(icon, color: color, size: 20),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: color,
            fontSize: 16,
          ),
        ),
        Text(label, style: TextStyle(fontSize: 11, color: Colors.grey[600])),
      ],
    );
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
