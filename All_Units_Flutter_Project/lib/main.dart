import 'package:flutter/material.dart';

void main() => runApp(const PracticalIndexApp());

class PracticalIndexApp extends StatelessWidget {
  const PracticalIndexApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Flutter Practicals - Units I to V')),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: const [
            Text('Jadav Tushar A. | Roll No. 15 | Atmiya University',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            SizedBox(height: 18),
            ListTile(title: Text('Unit I'), subtitle: Text('30 practical programs - lib/unit1/')),
            ListTile(title: Text('Unit II'), subtitle: Text('30 practical programs - lib/unit2/')),
            ListTile(title: Text('Unit III'), subtitle: Text('30 practical programs - lib/unit3/')),
            ListTile(title: Text('Unit IV'), subtitle: Text('30 practical programs - lib/unit4/')),
            ListTile(title: Text('Unit V'), subtitle: Text('10 official practical programs - lib/unit5/')),
            Divider(),
            Text('Total: 130 practical programs'),
            SizedBox(height: 12),
            Text('To test a practical, open its .dart file and run its main() function. See README.md for setup and package instructions.'),
          ],
        ),
      ),
    );
  }
}
