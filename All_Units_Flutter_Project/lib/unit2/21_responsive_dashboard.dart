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

  Widget panel(String title, IconData icon) => Card(
    child: Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Icon(icon, size: 40),
        const SizedBox(height: 8),
        Text(title, style: const TextStyle(fontSize: 18)),
      ]),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Responsive Dashboard')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return ListView(
              padding: const EdgeInsets.all(12),
              children: [
                SizedBox(height: 160, child: panel('Overview', Icons.dashboard)),
                SizedBox(height: 160, child: panel('Analytics', Icons.analytics)),
                SizedBox(height: 160, child: panel('Details', Icons.info)),
              ],
            );
          } else if (constraints.maxWidth < 1000) {
            return GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(12),
              children: [
                panel('Overview', Icons.dashboard),
                panel('Analytics', Icons.analytics),
                panel('Details', Icons.info),
                panel('Reports', Icons.bar_chart),
              ],
            );
          }

          return Row(
            children: [
              Expanded(flex: 1, child: panel('Sidebar', Icons.menu)),
              Expanded(flex: 2, child: panel('Content', Icons.dashboard)),
              Expanded(flex: 1, child: panel('Details', Icons.info)),
            ],
          );
        },
      ),
    );
  }
}

