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

  String message = 'Ready';

  Future<void> deleteFile() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/hello.txt');
    if (await file.exists()) {
      await file.delete();
      message = 'File deleted successfully';
    } else {
      message = 'File does not exist';
    }
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Delete File')),
    body: Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
      Text(message),
      ElevatedButton(onPressed: deleteFile, child: const Text('Delete File')),
    ])),
  );

}
