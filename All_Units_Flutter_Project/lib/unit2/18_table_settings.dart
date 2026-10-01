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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Table(
          border: TableBorder.all(),
          columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
          children: const [
            TableRow(children: [Padding(padding: EdgeInsets.all(12), child: Text('Setting')), Padding(padding: EdgeInsets.all(12), child: Text('Value'))]),
            TableRow(children: [Padding(padding: EdgeInsets.all(12), child: Text('Name')), Padding(padding: EdgeInsets.all(12), child: Text('Jadav Tushar'))]),
            TableRow(children: [Padding(padding: EdgeInsets.all(12), child: Text('City')), Padding(padding: EdgeInsets.all(12), child: Text('Rajkot'))]),
            TableRow(children: [Padding(padding: EdgeInsets.all(12), child: Text('Course')), Padding(padding: EdgeInsets.all(12), child: Text('BCA'))]),
            TableRow(children: [Padding(padding: EdgeInsets.all(12), child: Text('Goal')), Padding(padding: EdgeInsets.all(12), child: Text('Flutter Developer'))]),
          ],
        ),
      ),
    );
  }
}

