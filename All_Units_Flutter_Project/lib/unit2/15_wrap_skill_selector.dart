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


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final skills = ['Coding', 'Drawing', 'Gaming', 'Flutter', 'UI/UX', 'Travelling'];
  final selected = <String>{};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Skill Selector')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Wrap(
          spacing: 8,
          runSpacing: 8,
          children: skills.map((skill) {
            final isSelected = selected.contains(skill);
            return FilterChip(
              label: Text(skill),
              selected: isSelected,
              onSelected: (value) {
                setState(() {
                  value ? selected.add(skill) : selected.remove(skill);
                });
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}

