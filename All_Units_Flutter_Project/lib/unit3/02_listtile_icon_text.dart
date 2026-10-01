import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ItemScreen(),
    );
  }
}

class ItemScreen extends StatelessWidget {
  const ItemScreen({super.key});

  final List<String> items = const [
    'Home',
    'Profile',
    'Settings',
    'Messages',
    'Notifications',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ListTile Example')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.star),
            title: Text(items[index]),
          );
        },
      ),
    );
  }
}
