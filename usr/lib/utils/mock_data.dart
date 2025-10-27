class MockData {
  static List&lt;Device&gt; getMockDevices() {
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

  static List&lt;Map&lt;String, dynamic&gt;&gt; getMockGames() {
    return [
      {'name': 'Game A', 'id': '1', 'category': 'Action'},
      {'name': 'Game B', 'id': '2', 'category': 'Strategy'},
      {'name': 'Game C', 'id': '3', 'category': 'Action'},
    ];
  }

  static Map&lt;String, dynamic&gt; getMockSystemInfo(String deviceId) {
    return {'cpu': 50, 'ram': 70};
  }

  static List&lt;Map&lt;String, dynamic&gt;&gt; getMockHistory() {
    return [
      {'device': 'Gaming PC 1', 'timestamp': '2023-10-01 10:00 AM'},
      {'device': 'Workstation', 'timestamp': '2023-10-02 2:00 PM'},
    ];
  }

  static List&lt;Map&lt;String, dynamic&gt;&gt; getMockNotifications() {
    return [
      {'title': 'Device Connected', 'message': 'Gaming PC is online', 'type': 'device', 'time': '10:00 AM', 'read': false},
      {'title': 'Game Launched', 'message': 'Game A started', 'type': 'game', 'time': '9:45 AM', 'read': true},
    ];
  }
}