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
      appBar: AppBar(title: const Text('Card')),
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(20),
          clipBehavior: Clip.antiAlias,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(
                'https://picsum.photos/600/250',
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const ListTile(
                title: Text('Flutter Development'),
                subtitle: Text('Learning advanced Flutter widgets and layouts.'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

