class Notification {
  final String id;
  final String title;
  final String message;
  final String type;
  final String time;
  final bool read;

  Notification({
    required this.id,
    required this.title,
    required this.message,
    required this.type,
    required this.time,
    this.read = false,
  });

  factory Notification.fromJson(Map<String, dynamic> json) {
    return Notification(
      id: json['id'],
      title: json['title'],
      message: json['message'],
      type: json['type'],
      time: json['time'],
      read: json['read'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'message': message,
      'type': type,
      'time': time,
      'read': read,
    };
  }
}