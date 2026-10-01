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

  Widget section(String title, List<String> values) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Table(
          border: TableBorder.all(),
          children: [
            for (int i = 0; i < values.length; i++)
              TableRow(children: [
                Padding(padding: const EdgeInsets.all(10), child: Text('Option ${i + 1}')),
                Padding(padding: const EdgeInsets.all(10), child: Text(values[i])),
              ]),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.of(context).size.width > 700;

    final children = [
      section('Account', ['Jadav Tushar', 'Rajkot']),
      section('App', ['Notifications: On', 'Theme: System']),
      section('Privacy', ['Profile visibility: Friends', 'Location: Off']),
      section('About', ['Version: 1.0.0', 'Course: BCA']),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: wide
            ? GridView.count(crossAxisCount: 2, crossAxisSpacing: 16, mainAxisSpacing: 16, children: children)
            : ListView.separated(
                itemCount: children.length,
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemBuilder: (_, i) => children[i],
              ),
      ),
    );
  }
}

