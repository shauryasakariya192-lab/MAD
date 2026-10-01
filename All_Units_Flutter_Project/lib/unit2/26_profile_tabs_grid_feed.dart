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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          bottom: const TabBar(tabs: [
            Tab(text: 'Photos'),
            Tab(text: 'Activity'),
          ]),
        ),
        body: TabBarView(
          children: [
            GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, crossAxisSpacing: 6, mainAxisSpacing: 6,
              ),
              itemCount: 9,
              itemBuilder: (context, index) => Image.network(
                'https://picsum.photos/300/300?random=${index + 20}',
                fit: BoxFit.cover,
              ),
            ),
            ListView.builder(
              itemCount: 8,
              itemBuilder: (context, index) => ListTile(
                leading: const CircleAvatar(child: Icon(Icons.person)),
                title: Text('Activity ${index + 1}'),
                subtitle: const Text('Recent profile activity'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

