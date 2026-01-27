import 'package:flutter/material.dart';

class DashboardTimerAction extends StatelessWidget {
  final AnimationController animationController;
  final int refreshInterval;

  const DashboardTimerAction({
    super.key,
    required this.animationController,
    required this.refreshInterval,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          final progress = 1.0 - animationController.value;
          final seconds = (progress * refreshInterval).ceil();

          return Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 28,
                height: 28,
                child: CircularProgressIndicator(
                  value: progress,
                  strokeWidth: 2.5,
                  backgroundColor: Colors.indigo.withValues(alpha: 0.1),
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.indigo.shade400,
                  ),
                ),
              ),
              Text(
                '$seconds',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w900,
                  color: Colors.indigo.shade600,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
