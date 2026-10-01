import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  final controller = TextEditingController(text: 'ansh');
  String savedName = 'No saved value';

  @override
  void initState() { super.initState(); loadName(); }

  Future<void> saveName() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('student_name', controller.text);
    await loadName();
  }

  Future<void> loadName() async {
    final prefs = await SharedPreferences.getInstance();
    if (mounted) setState(() => savedName = prefs.getString('student_name') ?? 'No saved value');
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Save Student Name')),
    body: Padding(padding: const EdgeInsets.all(16), child: Column(children: [
      TextField(controller: controller),
      ElevatedButton(onPressed: saveName, child: const Text('Save')),
      Text('Stored: $savedName'),
    ])),
  );

}
