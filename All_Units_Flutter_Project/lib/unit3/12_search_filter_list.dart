import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SearchListScreen(),
    );
  }
}

class SearchListScreen extends StatefulWidget {
  const SearchListScreen({super.key});

  @override
  State<SearchListScreen> createState() => _SearchListScreenState();
}

class _SearchListScreenState extends State<SearchListScreen> {
  final List<String> names = [
    'Neel',
    'Rahul',
    'Riya',
    'Amit',
    'Neha',
    'Karan',
    'Pooja',
    'Vivek',
    'Priya',
    'Jay',
  ];

  String search = '';

  @override
  Widget build(BuildContext context) {
    final filtered = names
        .where((name) => name.toLowerCase().contains(search.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Search List')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => setState(() => search = value),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filtered.length,
              itemBuilder: (context, index) =>
                  ListTile(title: Text(filtered[index])),
            ),
          ),
        ],
      ),
    );
  }
}
