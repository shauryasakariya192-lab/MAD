import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Scaffold(
      appBar: AppBar(title: const Text('Write File')),
      body: Center(child: ElevatedButton(
        onPressed: () async {
          final dir = await getApplicationDocumentsDirectory();
          final file = File('${dir.path}/hello.txt');
          await file.writeAsString('Hello Flutter');
          debugPrint('Saved: ${file.path}');
        },
        child: const Text('Write "Hello Flutter"'),
      )),
    ));
  }
}
