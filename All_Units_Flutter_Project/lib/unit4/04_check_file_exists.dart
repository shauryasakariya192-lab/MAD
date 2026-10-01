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

  String message = 'Not checked yet';

  Future<void> checkFile() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/hello.txt');
    final exists = await file.exists();
    String result = exists ? await file.readAsString() : 'File does not exist';
    if (mounted) setState(() => message = result);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Check File Exists')),
    body: Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
      Text(message),
      ElevatedButton(onPressed: checkFile, child: const Text('Check & Read')),
    ])),
  );

}
