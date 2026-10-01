import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterModel extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CounterModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ReadWatchScreen(),
    );
  }
}

class ReadWatchScreen extends StatelessWidget {
  const ReadWatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // watch() subscribes this widget to changes.
    final count = context.watch<CounterModel>().count;

    return Scaffold(
      appBar: AppBar(title: const Text('read() vs watch()')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Watched Count: $count'),
            const SizedBox(height: 20),
            ElevatedButton(
              // read() accesses the model without subscribing.
              onPressed: () => context.read<CounterModel>().increment(),
              child: const Text('Increment using read()'),
            ),
            ElevatedButton(
              onPressed: () => context.read<CounterModel>().increment(),
              child: const Text('Another read() Button'),
            ),
          ],
        ),
      ),
    );
  }
}
