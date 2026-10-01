import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ToggleViewScreen(),
    );
  }
}

class ToggleViewScreen extends StatefulWidget {
  const ToggleViewScreen({super.key});

  @override
  State<ToggleViewScreen> createState() => _ToggleViewScreenState();
}

class _ToggleViewScreenState extends State<ToggleViewScreen> {
  bool grid = false;

  final List<String> items = const [
    'Apple',
    'Banana',
    'Mango',
    'Orange',
    'Grapes',
    'Papaya',
    'Guava',
    'Chikoo',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List / Grid Toggle'),
        actions: [
          IconButton(
            onPressed: () => setState(() => grid = !grid),
            icon: Icon(grid ? Icons.list : Icons.grid_view),
          ),
        ],
      ),
      body: grid
          ? GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Center(child: Text(items[index])),
                );
              },
            )
          : ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.local_florist),
                  title: Text(items[index]),
                );
              },
            ),
    );
  }
}
