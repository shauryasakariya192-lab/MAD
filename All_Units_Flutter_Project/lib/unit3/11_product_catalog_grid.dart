import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class Product {
  final String name;
  final double price;

  const Product(this.name, this.price);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const products = [
      Product('Laptop', 55000),
      Product('Phone', 25000),
      Product('Headphones', 2500),
      Product('Keyboard', 1500),
      Product('Mouse', 900),
      Product('Tablet', 18000),
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Product Catalog')),
        body: GridView.builder(
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.75,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return Card(
              child: Column(
                children: [
                  const Expanded(
                    child: Center(
                      child: Icon(Icons.image, size: 60),
                    ),
                  ),
                  Text(product.name),
                  Text('₹${product.price.toStringAsFixed(0)}'),
                  const SizedBox(height: 8),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
