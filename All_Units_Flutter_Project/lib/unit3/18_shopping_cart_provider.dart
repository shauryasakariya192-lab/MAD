import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartModel extends ChangeNotifier {
  final Map<String, double> products = {
    'Laptop': 55000,
    'Phone': 25000,
    'Headphones': 2500,
  };

  final List<String> cart = [];

  double get total => cart.fold(0, (sum, name) => sum + products[name]!);

  void add(String name) {
    cart.add(name);
    notifyListeners();
  }

  void remove(String name) {
    cart.remove(name);
    notifyListeners();
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CartModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CartScreen(),
    );
  }
}

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartModel>();

    return Scaffold(
      appBar: AppBar(title: const Text('Shopping Cart')),
      body: ListView(
        children: [
          for (final entry in cart.products.entries)
            ListTile(
              title: Text(entry.key),
              subtitle: Text('₹${entry.value.toStringAsFixed(0)}'),
              trailing: IconButton(
                icon: const Icon(Icons.add_shopping_cart),
                onPressed: () => context.read<CartModel>().add(entry.key),
              ),
            ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Total: ₹${cart.total.toStringAsFixed(0)}',
              style: const TextStyle(fontSize: 24),
            ),
          ),
          for (final item in cart.cart)
            ListTile(
              title: Text(item),
              trailing: IconButton(
                icon: const Icon(Icons.remove_circle),
                onPressed: () => context.read<CartModel>().remove(item),
              ),
            ),
        ],
      ),
    );
  }
}
