import 'package:flutter/material.dart';

class NotificationProvider with ChangeNotifier {
  List<Map<String, dynamic>> _notifications = [
    {'title': 'Device Connected', 'message': 'Gaming PC is online', 'type': 'device', 'time': '10:00 AM', 'read': false},
    {'title': 'Game Launched', 'message': 'Game A started', 'type': 'game', 'time': '9:45 AM', 'read': true},
  ];

  List<Map<String, dynamic>> get notifications => _notifications;

  void addNotification(Map<String, dynamic> notification) {
    _notifications.insert(0, notification);
    notifyListeners();
  }

  void clearAll() {
    _notifications.clear();
    notifyListeners();
  }

  // TODO: Integrate with Supabase for real notifications
}