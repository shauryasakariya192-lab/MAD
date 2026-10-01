import 'package:flutter/material.dart';

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

  final Map<String, String> cache = {};
  String result = 'No data';

  Future<void> loadData() async {
    const key = 'profile';
    if (cache.containsKey(key)) {
      result = 'CACHE HIT: ${cache[key]}';
    } else {
      await Future.delayed(const Duration(milliseconds: 500)); // mock API
      cache[key] = 'ansh - BCA - Rajkot';
      result = 'CACHE MISS: ${cache[key]}';
    }
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('In-Memory Cache')),
    body: Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
      Text(result),
      ElevatedButton(onPressed: loadData, child: const Text('Load Data')),
    ])),
  );

}
