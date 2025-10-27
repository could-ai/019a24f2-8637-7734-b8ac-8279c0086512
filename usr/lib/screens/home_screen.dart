import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../providers/device_provider.dart';
import '../widgets/device_card.dart';
import '../utils/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IQ CENTER'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () => Navigator.pushNamed(context, '/notifications'),
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => Navigator.pushNamed(context, '/settings'),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Constants.primaryColor),
              child: Text('Menu', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              title: const Text('Devices'),
              onTap: () => Navigator.pushNamed(context, '/devices'),
            ),
            ListTile(
              title: const Text('Library'),
              onTap: () => Navigator.pushNamed(context, '/library'),
            ),
            ListTile(
              title: const Text('Profile'),
              onTap: () => Navigator.pushNamed(context, '/profile'),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(Constants.welcomeMessage, style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 20),
            Expanded(
              child: Consumer<DeviceProvider>(
                builder: (context, provider, child) {
                  final connectedDevices = provider.devices.where((d) => d.isConnected).toList();
                  return GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.5,
                    ),
                    itemCount: connectedDevices.length + 1,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return Card(
                          child: InkWell(
                            onTap: () => Navigator.pushNamed(context, '/devices'),
                            child: const Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.add, size: 48, color: Constants.primaryColor),
                                  Text('Add Device'),
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                      final device = connectedDevices[index - 1];
                      return Hero(
                        tag: 'device-${device.id}',
                        child: DeviceCard(device: device),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<DeviceProvider>().scanDevices(),
        child: const Icon(Icons.search),
        tooltip: Constants.scanTooltip,
      ),
    );
  }
}