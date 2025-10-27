import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  final Map<String, dynamic> notification;

  const NotificationCard({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Card(
        elevation: notification['read'] ? 2 : 6,
        child: ListTile(
          leading: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: Icon(
              key: ValueKey(notification['type']),
              notification['type'] == 'device' ? Icons.computer : Icons.gamepad,
              color: notification['read'] ? Colors.grey : Theme.of(context).colorScheme.primary,
            ),
          ),
          title: Text(notification['title']),
          subtitle: Text(notification['message']),
          trailing: Text(notification['time']),
          onTap: () {
            // Mark as read
          },
        ),
      ),
    );
  }
}