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


class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const CustomButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: Text(text));
  }
}

class CustomCard extends StatelessWidget {
  final String title;
  final String subtitle;
  const CustomCard({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(title: Text(title), subtitle: Text(subtitle)),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) => AppBar(title: Text(title));

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Widget Library'),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CustomCard(title: 'ansh', subtitle: 'BCA Student'),
            const SizedBox(height: 20),
            CustomButton(text: 'Show Message', onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Hello!')));
            }),
          ],
        ),
      ),
    );
  }
}

