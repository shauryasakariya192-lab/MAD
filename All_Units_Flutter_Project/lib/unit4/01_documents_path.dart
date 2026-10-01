import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Scaffold(
      appBar: AppBar(title: const Text('Documents Directory')),
      body: Center(child: ElevatedButton(
        onPressed: () async {
          final dir = await getApplicationDocumentsDirectory();
          debugPrint(dir.path);
        },
        child: const Text('Print Documents Path'),
      )),
    ));
  }
}
