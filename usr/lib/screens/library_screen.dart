import 'package:flutter/material.dart';
import '../utils/mock_data.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final games = MockData.getMockGames();
    return Scaffold(
      appBar: AppBar(title: const Text('Game Library')),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
        ),
        itemCount: games.length,
        itemBuilder: (context, index) {
          final game = games[index];
          return Card(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.grey[300],
                    child: const Icon(Icons.gamepad, size: 48),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(game['name']),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Mock launch command
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Launching ${game['name']}')),
                    );
                  },
                  child: const Text('Launch'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}