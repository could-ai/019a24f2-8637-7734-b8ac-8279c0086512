import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/device.dart';
import '../utils/mock_data.dart';

class DeviceProvider with ChangeNotifier {
  List<Device> _devices = [];
  Device? _selectedDevice;
  bool _isScanning = false;

  List<Device> get devices => _devices;
  Device? get selectedDevice => _selectedDevice;
  bool get isScanning => _isScanning;

  void setSelectedDevice(Device device) {
    _selectedDevice = device;
    notifyListeners();
  }

  Future<void> scanDevices() async {
    _isScanning = true;
    notifyListeners();
    // Mock network scan for devices by MAC address
    await Future.delayed(const Duration(seconds: 2));
    _devices = MockData.getMockDevices();
    _isScanning = false;
    notifyListeners();
  }

  Future<void> connectToDevice(Device device) async {
    // Mock connection via MAC address
    final updatedDevice = device.copyWith(isConnected: true);
    _devices = _devices.map((d) => d.id == device.id ? updatedDevice : d).toList();
    notifyListeners();
    // TODO: Integrate with Supabase for real network connection
  }

  Future<void> disconnectFromDevice(Device device) async {
    final updatedDevice = device.copyWith(isConnected: false);
    _devices = _devices.map((d) => d.id == device.id ? updatedDevice : d).toList();
    notifyListeners();
  }

  Future<void> sendControlCommand(String command) async {
    if (_selectedDevice == null) return;
    // Mock API call for control (e.g., shutdown, launch game)
    final url = 'https://mock-api.example.com/control'; // Placeholder
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'macAddress': _selectedDevice!.macAddress,
          'command': command,
        }),
      );
      // Handle response (mocked)
      print('Command sent: $command');
    } catch (e) {
      print('Error: $e'); // TODO: Show error in UI
    }
  }

  Future<Map<String, dynamic>> getSystemInfo() async {
    if (_selectedDevice == null) return {};
    // Mock system monitoring data
    return MockData.getMockSystemInfo(_selectedDevice!.id);
  }
}