import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) => const MaterialApp(
    debugShowCheckedModeBanner: false, home: HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String content = 'Press Load to read the file.';

  Future<void> loadFile() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/hello.txt');
    final text = await file.exists() ? await file.readAsString() : 'File not found';
    if (mounted) setState(() => content = text);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Read File')),
    body: Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
      Text(content),
      const SizedBox(height: 12),
      ElevatedButton(onPressed: loadFile, child: const Text('Load File')),
    ])),
  );

}
