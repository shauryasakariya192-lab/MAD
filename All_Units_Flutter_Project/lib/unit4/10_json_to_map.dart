import 'dart:convert';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Scaffold(
      appBar: AppBar(title: const Text('JSON to Map')),
      body: 
  Center(child: Builder(builder: (context) {
    const source = '{"name":"ansh","course":"BCA","city":"Rajkot"}';
    final data = jsonDecode(source) as Map<String, dynamic>;
    debugPrint('Name: ${data['name']}, Course: ${data['course']}');
    return Text('Name: ${data['name']}\nCourse: ${data['course']}\nCity: ${data['city']}');
  })),
    ));
  }
}
