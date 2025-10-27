import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/device_provider.dart';
import '../widgets/monitoring_chart.dart';

class ControlScreen extends StatefulWidget {
  const ControlScreen({super.key});

  @override
  State<ControlScreen> createState() => _ControlScreenState();
}

class _ControlScreenState extends State<ControlScreen> {
  Map<String, dynamic> _systemInfo = {};

  @override
  void initState() {
    super.initState();
    _loadSystemInfo();
  }

  Future<void> _loadSystemInfo() async {
    final provider = context.read<DeviceProvider>();
    _systemInfo = await provider.getSystemInfo();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DeviceProvider>();
    final device = provider.selectedDevice;
    if (device == null) return const Scaffold(body: Center(child: Text('No device selected')));

    return Scaffold(
      appBar: AppBar(title: Text('Control ${device.name}')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('MAC: ${device.macAddress}', style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 20),
            MonitoringChart(data: _systemInfo),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => provider.sendControlCommand('shutdown'),
                  child: const Text('Shutdown'),
                ),
                ElevatedButton(
                  onPressed: () => provider.sendControlCommand('restart'),
                  child: const Text('Restart'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/library'),
              child: const Text('Launch Game'),
            ),
          ],
        ),
      ),
    );
  }
}