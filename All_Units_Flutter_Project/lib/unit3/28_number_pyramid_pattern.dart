import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const PyramidScreen(),
    );
  }
}

class PyramidScreen extends StatefulWidget {
  const PyramidScreen({super.key});

  @override
  State<PyramidScreen> createState() => _PyramidScreenState();
}

class _PyramidScreenState extends State<PyramidScreen> {
  final controller = TextEditingController();
  int rows = 0;

  void generate() {
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
      appBar: AppBar(title: const Text('Number Pyramid')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Enter N'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(onPressed: generate, child: const Text('Generate')),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: List.generate(rows, (row) {
                  final numbers = List.generate(
                    row + 1,
                    (column) => column + 1,
                  );
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Center(
                      child: Text(
                        numbers.join(' '),
                        style: const TextStyle(fontSize: 24),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
