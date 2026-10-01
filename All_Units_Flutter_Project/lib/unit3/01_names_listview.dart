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
      home: const NamesScreen(),
    );
  }
}

class NamesScreen extends StatelessWidget {
  const NamesScreen({super.key});

  final List<String> names = const [
    'ansh',
    'Rahul',
    'Riya',
    'Amit',
    'Neha',
    'Karan',
    'Pooja',
    'Vivek',
    'Priya',
    'Jay',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Names List')),
      body: ListView.builder(
        itemCount: names.length,
        itemBuilder: (context, index) {
          return ListTile(title: Text(names[index]));
        },
      ),
    );
  }
}
