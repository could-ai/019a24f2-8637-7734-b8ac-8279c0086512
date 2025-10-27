import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/device_provider.dart';
import '../widgets/device_card.dart';

class DevicesScreen extends StatelessWidget {
  const DevicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Devices')),
      body: Consumer<DeviceProvider>(
        builder: (context, provider, child) {
          if (provider.isScanning) {
            return const Center(child: CircularProgressIndicator());
          }
          return RefreshIndicator(
            onRefresh: provider.scanDevices,
            child: ListView.builder(
              itemCount: provider.devices.length,
              itemBuilder: (context, index) {
                final device = provider.devices[index];
                return Hero(
                  tag: 'device-${device.id}',
                  child: DeviceCard(
                    device: device,
                    onTap: () {
                      provider.setSelectedDevice(device);
                      Navigator.pushNamed(context, '/control');
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<DeviceProvider>().scanDevices(),
        child: const Icon(Icons.refresh),
        tooltip: 'Refresh Scan',
      ),
    );
  }
}