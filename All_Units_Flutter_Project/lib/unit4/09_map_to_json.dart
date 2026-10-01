import 'dart:convert';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Scaffold(
      appBar: AppBar(title: const Text('Map to JSON')),
      body: 
  Center(child: Builder(builder: (context) {
    final student = {'name': 'ansh', 'rollNo': 15, 'percentage': 90};
    final jsonString = jsonEncode(student);
    return Padding(padding: const EdgeInsets.all(16), child: Text(jsonString));
  })),
    ));
  }
}
