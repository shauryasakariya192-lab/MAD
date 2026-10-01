import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const StarPatternScreen(),
    );
  }
}

class StarPatternScreen extends StatefulWidget {
  const StarPatternScreen({super.key});

  @override
  State<StarPatternScreen> createState() => _StarPatternScreenState();
}

class _StarPatternScreenState extends State<StarPatternScreen> {
  final controller = TextEditingController();
  int rows = 0;

  void generatePattern() {
    setState(() {
      rows = int.tryParse(controller.text) ?? 0;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Star Pattern')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Number of rows'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: generatePattern,
              child: const Text('Generate'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: List.generate(
                  rows,
                  (index) => Text(
                    '*' * (index + 1),
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
