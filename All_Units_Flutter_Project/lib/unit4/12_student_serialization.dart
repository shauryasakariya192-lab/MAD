import 'dart:convert';
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: Demo()));

class Student {
  final String name; final int rollNo; final int marks;
  Student(this.name, this.rollNo, this.marks);
  Map<String,dynamic> toJson()=>{'name':name,'rollNo':rollNo,'marks':marks};
  factory Student.fromJson(Map<String,dynamic> j)=>Student(j['name'],j['rollNo'],j['marks']);
}

class Demo extends StatelessWidget {
  const Demo({super.key});
  @override Widget build(BuildContext context) {
    final s=Student('ansh',15,90);
    final encoded=jsonEncode(s.toJson());
    final restored=Student.fromJson(jsonDecode(encoded));
    return Scaffold(appBar: AppBar(title: const Text('Student JSON')),
      body: Padding(padding: const EdgeInsets.all(16), child: Text(
        'JSON: $encoded\n\nRestored: ${restored.name}, Roll ${restored.rollNo}, Marks ${restored.marks}')));
  }
}
