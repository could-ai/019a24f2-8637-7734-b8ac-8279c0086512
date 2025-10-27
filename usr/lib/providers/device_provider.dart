import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/device.dart';
import '../utils/mock_data.dart';
import '../integrations/supabase.dart';

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
    // Use Edge Function for secure command sending
    final url = '${SupabaseConfig.supabaseUrl}/functions/v1/control-command';
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${SupabaseConfig.supabaseAnonKey}',
        },
        body: jsonEncode({
          'macAddress': _selectedDevice!.macAddress,
          'command': command,
        }),
      );
      if (response.statusCode == 200) {
        print('Command sent successfully');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<Map<String, dynamic>> getSystemInfo() async {
    if (_selectedDevice == null) return {};
    return MockData.getMockSystemInfo(_selectedDevice!.id);
  }
}