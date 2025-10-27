import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/notification_provider.dart';
import '../widgets/notification_card.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        actions: [
          Consumer<NotificationProvider>(
            builder: (context, provider, child) {
              return AnimatedOpacity(
                opacity: provider.notifications.isNotEmpty ? 1.0 : 0.5,
                duration: const Duration(milliseconds: 300),
                child: IconButton(
                  icon: const Icon(Icons.clear_all),
                  onPressed: provider.notifications.isEmpty ? null : () => provider.clearAll(),
                ),
              );
            },
          ),
        ],
      ),
      body: Consumer<NotificationProvider>(
        builder: (context, provider, child) {
          final notifications = provider.notifications;
          if (notifications.isEmpty) {
            return const Center(
              child: Text('No notifications yet'),
            );
          }
          return AnimatedList(
            initialItemCount: notifications.length,
            itemBuilder: (context, index, animation) {
              return SlideTransition(
                position: animation.drive(Tween(
                  begin: const Offset(1, 0),
                  end: Offset.zero,
                )),
                child: NotificationCard(notification: notifications[index]),
              );
            },
          );
        },
      ),
    );
  }
}