import 'package:dvm_app/features/vitals/domain/entities/entities.dart';
import 'package:dvm_app/features/vitals/presentation/blocs/vitals/vitals_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersistLogButton extends StatelessWidget {
  final SensorData sensorData;
  final String? deviceId;

  const PersistLogButton({super.key, required this.sensorData, this.deviceId});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.green.withValues(alpha: 0.25),
                  blurRadius: 15,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: ElevatedButton(
              onPressed: () => _logCurrentStatus(context, sensorData),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[600],
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 0,
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.cloud_upload_rounded),
                  SizedBox(width: 12),
                  Text(
                    'PERSIST LOG NOW',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _logCurrentStatus(BuildContext context, SensorData sensorData) {
    if (deviceId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          content: const Row(
            children: [
              Icon(Icons.warning_amber_rounded, color: Colors.white),
              SizedBox(width: 16),
              Text('Device identification not ready. Try again...'),
            ],
          ),
          backgroundColor: Colors.orange[800],
          duration: const Duration(seconds: 2),
        ),
      );
      return;
    }

    final log = VitalLog(
      deviceId: deviceId!,
      timestamp: DateTime.now().toUtc(),
      thermalValue: sensorData.thermalValue,
      batteryLevel: sensorData.batteryLevel,
      memoryUsage: sensorData.memoryUsage,
    );

    context.read<VitalsCubit>().postLog(log);
  }
}
