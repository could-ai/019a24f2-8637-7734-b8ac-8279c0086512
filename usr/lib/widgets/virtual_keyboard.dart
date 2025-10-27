import 'package:flutter/material.dart';

class VirtualKeyboard extends StatelessWidget {
  const VirtualKeyboard({super.key});

  void _sendKey(String key) {
    // Mock send key command via MAC
    print('Sending key: $key');
  }

  @override
  Widget build(BuildContext context) {
    final keys = [
      ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0'],
      ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'],
      ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'],
      ['Z', 'X', 'C', 'V', 'B', 'N', 'M'],
    ];

    return AnimatedOpacity(
      opacity: 1.0,
      duration: const Duration(milliseconds: 500),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text('Virtual Keyboard', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              ...keys.map((row) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: row.map((key) => AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: const EdgeInsets.all(2.0),
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () => _sendKey(key),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: Text(key, style: const TextStyle(fontSize: 16)),
                    ),
                  ),
                )).toList(),
              )),
            ],
          ),
        ),
      ),
    );
  }
}