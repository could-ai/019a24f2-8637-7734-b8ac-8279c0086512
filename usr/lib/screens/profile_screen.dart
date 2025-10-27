import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../utils/mock_data.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    final user = authProvider.user;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              authProvider.signOut();
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Theme.of(context).colorScheme.primary,
                child: Text(
                  user?['name']?[0] ?? 'U',
                  style: const TextStyle(fontSize: 32, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 16),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: Text(
                'Name: ${user?['name'] ?? 'User'}',
                key: ValueKey(user?['name']),
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Text('Email: ${user?['email'] ?? 'user@example.com'}', style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 24),
            const Text('Connection History:', style: TextStyle(fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView.builder(
                itemCount: MockData.getMockHistory().length,
                itemBuilder: (context, index) {
                  final item = MockData.getMockHistory()[index];
                  return AnimatedOpacity(
                    opacity: 1.0,
                    duration: const Duration(milliseconds: 300),
                    child: ListTile(
                      title: Text(item['device']),
                      subtitle: Text(item['timestamp']),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}