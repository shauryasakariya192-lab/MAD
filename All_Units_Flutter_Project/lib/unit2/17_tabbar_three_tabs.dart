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
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Files'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Photos', icon: Icon(Icons.photo)),
              Tab(text: 'Videos', icon: Icon(Icons.video_library)),
              Tab(text: 'Files', icon: Icon(Icons.folder)),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text('Photo content')),
            Center(child: Text('Video content')),
            Center(child: Text('File content')),
          ],
        ),
      ),
    );
  }
}

