import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unit II Practical',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
      home: const HomePage(),
    );
  }
}


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<String> fruits = const [
    'Apple', 'Banana', 'Mango', 'Orange', 'Grapes',
    'Watermelon', 'Pineapple', 'Papaya', 'Guava', 'Strawberry',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fruits')),
      body: ListView.builder(
        itemCount: fruits.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.apple),
            title: Text(fruits[index]),
          );
        },
      ),
    );
  }
}

