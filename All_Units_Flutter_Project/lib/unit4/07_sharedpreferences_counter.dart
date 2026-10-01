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

  int count = 0;
  @override
  void initState() { super.initState(); load(); }
  Future<void> load() async {
    final p = await SharedPreferences.getInstance();
    if (mounted) setState(() => count = p.getInt('counter') ?? 0);
  }
  Future<void> increment() async {
    final p = await SharedPreferences.getInstance();
    setState(() => count++);
    await p.setInt('counter', count);
  }
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Persistent Counter')),
    body: Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
      Text('$count', style: const TextStyle(fontSize: 36)),
      ElevatedButton(onPressed: increment, child: const Text('Increment')),
    ])),
  );

}
