import 'package:dvm_app/core/utils/thermal_mapper.dart';
import 'package:dvm_app/features/vitals/domain/entities/entities.dart';
import 'package:dvm_app/core/widgets/sensor_card.dart';
import 'package:flutter/material.dart';

class ThermalHealthCard extends StatelessWidget {
  final SensorData data;
  final VoidCallback onRefresh;

  const ThermalHealthCard({
    super.key,
    required this.data,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return SensorCard(
      isPrimary: true,
      title: 'Thermal Health',
      value: ThermalMapper.getLabel(data.thermalValue),
      subtitle: 'Value identifier: ${data.thermalValue}',
      icon: Icons.thermostat_rounded,
      color: _getThermalColor(data.thermalValue),
      onAction: onRefresh,
      actionIcon: Icons.refresh_rounded,
    );
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
}
