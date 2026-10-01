import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class Student {
  final String name;
  final int rollNo;
  final double marks;

  const Student({
    required this.name,
    required this.rollNo,
    required this.marks,
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const student = Student(
      name: 'Jadav Tushar',
      rollNo: 15,
      marks: 90,
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Student Home')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const DetailScreen(student: student),
              ),
            );
          },
          child: const Text('View Student Details'),
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final Student student;

  const DetailScreen({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Student Details')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${student.name}'),
            Text('Roll No: ${student.rollNo}'),
            Text('Marks: ${student.marks}%'),
          ],
        ),
      ),
    );
  }
}
