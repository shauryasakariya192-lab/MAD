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


class LifecycleLogger extends StatefulWidget {
  final Widget child;
  const LifecycleLogger({super.key, required this.child});

  @override
  State<LifecycleLogger> createState() => _LifecycleLoggerState();
}

class _LifecycleLoggerState extends State<LifecycleLogger> {
  void log(String event) => print('${DateTime.now().toIso8601String()} - $event');

  @override
  void initState() {
    super.initState();
    log('initState');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    log('didChangeDependencies');
  }

  @override
  void didUpdateWidget(covariant LifecycleLogger oldWidget) {
    super.didUpdateWidget(oldWidget);
    log('didUpdateWidget');
  }

  @override
  void deactivate() {
    log('deactivate');
    super.deactivate();
  }

  @override
  void dispose() {
    log('dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log('build');
    return widget.child;
  }
}

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lifecycle Logger')),
      body: Center(child: Text('Count: $count', style: const TextStyle(fontSize: 30))),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => count++),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const LifecycleLogger(child: Counter());
  }
}

