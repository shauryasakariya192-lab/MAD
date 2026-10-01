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


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            children: [
              Image.network(
                'https://picsum.photos/900/350',
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 70),
              const Text('Jadav Tushar', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text('BCA Student • Flutter Developer'),
            ],
          ),
          const Positioned(
            top: 190,
            left: 0,
            right: 0,
            child: Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage('https://i.pravatar.cc/200?img=12'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

