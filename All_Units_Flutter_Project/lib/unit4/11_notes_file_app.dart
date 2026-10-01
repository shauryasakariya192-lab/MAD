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

  final controller = TextEditingController();
  String saved = '';

  Future<File> noteFile() async {
    final dir = await getApplicationDocumentsDirectory();
    return File('${dir.path}/note.txt');
  }
  Future<void> save() async {
    final f = await noteFile(); await f.writeAsString(controller.text); await load();
  }
  Future<void> load() async {
    final f = await noteFile();
    saved = await f.exists() ? await f.readAsString() : '';
    if (mounted) setState(() => controller.text = saved);
  }
  @override
  void initState() { super.initState(); load(); }
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Local Notes')),
    body: Padding(padding: const EdgeInsets.all(16), child: Column(children: [
      TextField(controller: controller, maxLines: 5, decoration: const InputDecoration(border: OutlineInputBorder())),
      ElevatedButton(onPressed: save, child: const Text('Save Note')),
      Text('Saved: $saved'),
    ])),
  );

}
