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


class Product {
  final String name;
  final double price;
  final String imageUrl;

  const Product(this.name, this.price, this.imageUrl);
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const products = [
    Product('Phone', 19999, 'https://picsum.photos/400/300?1'),
    Product('Laptop', 59999, 'https://picsum.photos/400/300?2'),
    Product('Headphones', 2499, 'https://picsum.photos/400/300?3'),
    Product('Watch', 3999, 'https://picsum.photos/400/300?4'),
    Product('Keyboard', 1499, 'https://picsum.photos/400/300?5'),
    Product('Mouse', 899, 'https://picsum.photos/400/300?6'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: .72, crossAxisSpacing: 12, mainAxisSpacing: 12,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final p = products[index];
          return Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: Image.network(p.imageUrl, width: double.infinity, fit: BoxFit.cover)),
                Padding(padding: const EdgeInsets.all(8), child: Text(p.name, style: const TextStyle(fontWeight: FontWeight.bold))),
                Padding(padding: const EdgeInsets.fromLTRB(8, 0, 8, 8), child: Text('₹${p.price.toStringAsFixed(0)}')),
              ],
            ),
          );
        },
      ),
    );
  }
}

