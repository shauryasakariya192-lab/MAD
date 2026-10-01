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

  Widget field(String label) => TextField(
    decoration: InputDecoration(labelText: label, border: const OutlineInputBorder()),
  );

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.of(context).size.width >= 600;

    return Scaffold(
      appBar: AppBar(title: const Text('Responsive Form')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: wide
            ? Row(
                children: [
                  Expanded(child: field('First Name')),
                  const SizedBox(width: 16),
                  Expanded(child: field('Last Name')),
                ],
              )
            : Column(
                children: [
                  field('First Name'),
                  const SizedBox(height: 16),
                  field('Last Name'),
                ],
              ),
      ),
    );
  }
}

