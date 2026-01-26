import 'package:dvm_app/core/utils/utils.dart';
import 'package:dvm_app/features/vitals/domain/entities/entities.dart';
import 'package:flutter/material.dart';

class VitalLogTile extends StatelessWidget {
  final VitalLog log;

  const VitalLogTile({super.key, required this.log});

  @override
  Widget build(BuildContext context) {
    final thermalColor = _getThermalColor(log.thermalValue);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Status Accent Sidebar
              Container(width: 6, color: thermalColor),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header: Timestamp and Relative time
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.access_time_rounded,
                                size: 14,
                                color: Colors.grey[600],
                              ),
                              const SizedBox(width: 4),
                              Text(
                                DateFormatter.format(log.timestamp),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            DateFormatter.getRelativeTime(log.timestamp),
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Sensor Stats Row
                      Row(
                        children: [
                          Expanded(
                            child: _buildSensorMetric(
                              'Thermal',
                              ThermalMapper.getLabel(log.thermalValue),
                              thermalColor,
                              Icons.thermostat_rounded,
                              log.thermalValue / 3,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _buildSensorMetric(
                              'Battery',
                              '${log.batteryLevel.toStringAsFixed(0)}%',
                              _getBatteryColor(log.batteryLevel),
                              Icons.bolt_rounded,
                              log.batteryLevel / 100,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _buildSensorMetric(
                              'Memory',
                              '${log.memoryUsage.toStringAsFixed(0)}%',
                              _getMemoryColor(log.memoryUsage),
                              Icons.memory_rounded,
                              log.memoryUsage / 100,
                            ),
                          ),
                        ],
                      ),

                      // Device ID footer
                      if (log.deviceId.isNotEmpty) ...[
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Icon(
                              Icons.developer_board_rounded,
                              size: 12,
                              color: Colors.grey[400],
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Device: ${log.deviceId}',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey[500],
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSensorMetric(
    String label,
    String value,
    Color color,
    IconData icon,
    double progress,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 14),
            const SizedBox(width: 4),
            Flexible(
              child: Text(
                value,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: color.withOpacity(0.9),
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          label.toUpperCase(),
          style: TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.w800,
            color: Colors.grey[400],
            letterSpacing: 0.8,
          ),
        ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(2),
          child: LinearProgressIndicator(
            value: progress.clamp(0.0, 1.0),
            backgroundColor: color.withOpacity(0.1),
            valueColor: AlwaysStoppedAnimation<Color>(color),
            minHeight: 2,
          ),
        ),
      ],
    );
  }

  Color _getThermalColor(int thermalValue) {
    switch (thermalValue) {
      case 0:
        return Colors.green;
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
    if (batteryLevel > 60) return Colors.green[600]!;
    if (batteryLevel > 20) return Colors.orange[600]!;
    return Colors.red[600]!;
  }

  Color _getMemoryColor(double memoryUsage) {
    if (memoryUsage < 60) return Colors.green[600]!;
    if (memoryUsage < 80) return Colors.orange[600]!;
    return Colors.red[600]!;
  }
}
