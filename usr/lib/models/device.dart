class Device {
  final String id;
  final String name;
  final String macAddress;
  final String ipAddress;
  final bool isConnected;
  final Map<String, dynamic> systemInfo; // e.g., CPU, RAM

  Device({
    required this.id,
    required this.name,
    required this.macAddress,
    required this.ipAddress,
    this.isConnected = false,
    this.systemInfo = const {},
  });

  Device copyWith({
    String? id,
    String? name,
    String? macAddress,
    String? ipAddress,
    bool? isConnected,
    Map<String, dynamic>? systemInfo,
  }) {
    return Device(
      id: id ?? this.id,
      name: name ?? this.name,
      macAddress: macAddress ?? this.macAddress,
      ipAddress: ipAddress ?? this.ipAddress,
      isConnected: isConnected ?? this.isConnected,
      systemInfo: systemInfo ?? this.systemInfo,
    );
  }

  factory Device.fromJson(Map<String, dynamic> json) {
    return Device(
      id: json['id'],
      name: json['name'],
      macAddress: json['macAddress'],
      ipAddress: json['ipAddress'],
      isConnected: json['isConnected'] ?? false,
      systemInfo: json['systemInfo'] ?? {},
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'macAddress': macAddress,
      'ipAddress': ipAddress,
      'isConnected': isConnected,
      'systemInfo': systemInfo,
    };
  }
}