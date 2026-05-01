import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;

  void _increment() => setState(() => _counter++);
  void _decrement() => setState(() {
        if (_counter > 0) _counter--;
      });
  void _reset() => setState(() => _counter = 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.lightBlue[700],
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Nilai Counter:',
              style: TextStyle(fontSize: 20, color: Colors.black54),
            ),
            const SizedBox(height: 16),
            Text(
              '$_counter',
              style: TextStyle(
                fontSize: 80,
                fontWeight: FontWeight.bold,
                color: Colors.lightBlue[700],
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Decrement
                ElevatedButton(
                  onPressed: _decrement,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    foregroundColor: Colors.white,
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(20),
                  ),
                  child: const Icon(Icons.remove, size: 28),
                ),
                const SizedBox(width: 20),
                // Reset
                ElevatedButton(
                  onPressed: _reset,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[400],
                    foregroundColor: Colors.white,
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(20),
                  ),
                  child: const Icon(Icons.refresh, size: 28),
                ),
                const SizedBox(width: 20),
                // Increment
                ElevatedButton(
                  onPressed: _increment,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue[600],
                    foregroundColor: Colors.white,
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(20),
                  ),
                  child: const Icon(Icons.add, size: 28),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
