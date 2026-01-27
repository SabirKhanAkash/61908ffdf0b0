import 'package:flutter/material.dart';

class AnalyticsErrorView extends StatelessWidget {
  final String message;

  const AnalyticsErrorView({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  'Analytics: $message',
                  style: TextStyle(color: Colors.red[700]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
