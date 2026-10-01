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


class ProfileCard extends StatelessWidget {
  final String name;
  final String role;
  final String imageUrl;
  final VoidCallback onTap;

  const ProfileCard({
    super.key,
    required this.name,
    required this.role,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(backgroundImage: NetworkImage(imageUrl)),
        title: Text(name),
        subtitle: Text(role),
        trailing: IconButton(icon: const Icon(Icons.message), onPressed: onTap),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void showMessage(BuildContext context, String name) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Message: $name')));
  }

  @override
  Widget build(BuildContext context) {
    final data = [
      ['ABC', 'Designer', 'https://i.pravatar.cc/100?img=1'],
      ['XYZ', 'Developer', 'https://i.pravatar.cc/100?img=2'],
      ['PQR', 'Student', 'https://i.pravatar.cc/100?img=3'],
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Profile Cards')),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          for (final item in data)
            ProfileCard(
              name: item[0],
              role: item[1],
              imageUrl: item[2],
              onTap: () => showMessage(context, item[0]),
            ),
        ],
      ),
    );
  }
}

