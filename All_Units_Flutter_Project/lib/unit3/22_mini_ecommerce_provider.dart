import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Product {
  final String name;
  final double price;
  const Product(this.name, this.price);
}

class ShopModel extends ChangeNotifier {
  final List<Product> products = const [
    Product('Laptop', 55000),
    Product('Phone', 25000),
    Product('Headphones', 2500),
    Product('Tablet', 18000),
  ];

  final List<Product> cart = [];

  double get total => cart.fold(0, (sum, item) => sum + item.price);

  void add(Product product) {
    cart.add(product);
    notifyListeners();
  }

  void remove(Product product) {
    cart.remove(product);
    notifyListeners();
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ShopModel(),
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
      home: const ProductScreen(),
    );
  }
}

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final shop = context.watch<ShopModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CartScreen()),
              );
            },
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.9,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: shop.products.length,
        itemBuilder: (context, index) {
          final product = shop.products[index];
          return Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.image, size: 60),
                Text(product.name),
                Text('₹${product.price.toStringAsFixed(0)}'),
                ElevatedButton(
                  onPressed: () => context.read<ShopModel>().add(product),
                  child: const Text('Add'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final shop = context.watch<ShopModel>();

    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: shop.cart.length,
              itemBuilder: (context, index) {
                final product = shop.cart[index];
                return ListTile(
                  title: Text(product.name),
                  subtitle: Text('₹${product.price.toStringAsFixed(0)}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () =>
                        context.read<ShopModel>().remove(product),
                  ),
                );
              },
            ),
          ),
          Text(
            'Total: ₹${shop.total.toStringAsFixed(0)}',
            style: const TextStyle(fontSize: 22),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: ElevatedButton(
              onPressed: shop.cart.isEmpty
                  ? null
                  : () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CheckoutScreen(
                            items: List<Product>.from(shop.cart),
                            total: shop.total,
                          ),
                        ),
                      );
                    },
              child: const Text('Checkout'),
            ),
          ),
        ],
      ),
    );
  }
}

class CheckoutScreen extends StatelessWidget {
  final List<Product> items;
  final double total;

  const CheckoutScreen({
    super.key,
    required this.items,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout Summary')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (final item in items) Text('${item.name} - ₹${item.price}'),
            const Divider(),
            Text('Total: ₹${total.toStringAsFixed(0)}'),
          ],
        ),
      ),
    );
  }
}
