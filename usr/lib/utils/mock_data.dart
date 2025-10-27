import '../models/device.dart';

class MockData {
  static List<Device> getMockDevices() {
    return [
      Device(
        id: '1',
        name: 'Gaming PC 1',
        macAddress: '00:1B:44:11:3A:B7',
        ipAddress: '192.168.1.100',
        isConnected: true,
        systemInfo: {'cpu': 45, 'ram': 60},
      ),
      Device(
        id: '2',
        name: 'Workstation',
        macAddress: '00:1B:44:11:3A:B8',
        ipAddress: '192.168.1.101',
        isConnected: false,
      ),
    ];
  }

  static List<Map<String, dynamic>> getMockGames() {
    return [
      {'name': 'Game A', 'id': '1'},
      {'name': 'Game B', 'id': '2'},
      {'name': 'Game C', 'id': '3'},
    ];
  }

  static Map<String, dynamic> getMockSystemInfo(String deviceId) {
    return {'cpu': 50, 'ram': 70}; // Simulated data
  }
}