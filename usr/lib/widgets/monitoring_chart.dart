import 'package:flutter/material.dart';

class MonitoringChart extends StatelessWidget {
  final Map<String, dynamic> data;

  const MonitoringChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: Card(
        key: ValueKey(data),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text('System Monitoring', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildMetric('CPU', '${data['cpu'] ?? 0}%'),
                  _buildMetric('RAM', '${data['ram'] ?? 0}%'),
                ],
              ),
              // Placeholder for future chart implementation
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMetric(String label, String value) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: Column(
        key: ValueKey(value),
        children: [
          Text(label, style: const TextStyle(fontSize: 16)),
          Text(value, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}