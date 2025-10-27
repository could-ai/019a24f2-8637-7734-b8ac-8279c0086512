import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../providers/device_provider.dart';
import '../widgets/device_card.dart';

class DeviceCard extends StatelessWidget {
  final Device device;
  final VoidCallback? onTap;

  const DeviceCard({super.key, required this.device, this.onTap});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: Card(
        elevation: 4,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.computer,
                  size: 48,
                  color: device.isConnected ? Colors.green : Colors.grey,
                ),
                const SizedBox(height: 8),
                Text(device.name, style: Theme.of(context).textTheme.titleMedium),
                Text('MAC: ${device.macAddress}', style: Theme.of(context).textTheme.bodySmall),
                AnimatedOpacity(
                  opacity: device.isConnected ? 1.0 : 0.5,
                  duration: const Duration(milliseconds: 300),
                  child: Text(
                    device.isConnected ? 'Connected' : 'Disconnected',
                    style: TextStyle(
                      color: device.isConnected ? Colors.green : Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}