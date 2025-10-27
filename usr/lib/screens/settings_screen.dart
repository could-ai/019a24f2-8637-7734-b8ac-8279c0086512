import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../providers/device_provider.dart';
import '../widgets/device_card.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _darkMode = false;
  bool _notificationsEnabled = true;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _darkMode = prefs.getBool('darkMode') ?? false;
      _notificationsEnabled = prefs.getBool('notifications') ?? true;
    });
  }

  Future<void> _saveSettings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('darkMode', _darkMode);
    await prefs.setBool('notifications', _notificationsEnabled);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: ListView(
          key: ValueKey(_darkMode),
          children: [
            SwitchListTile(
              title: const Text('Dark Mode'),
              value: _darkMode,
              onChanged: (value) {
                setState(() => _darkMode = value);
                _saveSettings();
              },
            ),
            SwitchListTile(
              title: const Text('Enable Notifications'),
              value: _notificationsEnabled,
              onChanged: (value) {
                setState(() => _notificationsEnabled = value);
                _saveSettings();
              },
            ),
            ListTile(
              title: const Text('Profile'),
              subtitle: const Text('Manage your account'),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () => Navigator.pushNamed(context, '/profile'),
            ),
            ListTile(
              title: const Text('Notifications'),
              subtitle: const Text('View alerts'),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () => Navigator.pushNamed(context, '/notifications'),
            ),
          ],
        ),
      ),
    );
  }
}