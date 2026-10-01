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
      appBar: AppBar(title: const Text('Product Details')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Stack(
            children: [
              AspectRatio(
                aspectRatio: 1.3,
                child: Image.network('https://picsum.photos/700/500', fit: BoxFit.cover),
              ),
              Positioned(
                top: 12,
                left: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  color: Colors.red,
                  child: const Text('20% OFF', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text('Wireless Headphones', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            children: const [
              Chip(label: Text('Wireless')),
              Chip(label: Text('Bluetooth')),
              Chip(label: Text('Noise Control')),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const Expanded(child: Text('₹2,499', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
              Expanded(child: ElevatedButton(onPressed: () {}, child: const Text('Add to Cart'))),
            ],
          ),
        ],
      ),
    );
  }
}

