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


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selected = 0;
  final titles = ['Home', 'Search', 'Profile'];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final desktop = constraints.maxWidth >= 800;

        final content = Center(
          child: Text(titles[selected], style: const TextStyle(fontSize: 32)),
        );

        if (!desktop) {
          return Scaffold(
            appBar: AppBar(title: const Text('Navigation Shell')),
            drawer: Drawer(
              child: ListView(
                children: [
                  const DrawerHeader(child: Text('Menu')),
                  for (int i = 0; i < titles.length; i++)
                    ListTile(
                      title: Text(titles[i]),
                      onTap: () {
                        setState(() => selected = i);
                        Navigator.pop(context);
                      },
                    ),
                ],
              ),
            ),
            body: content,
          );
        }

        return Scaffold(
          appBar: AppBar(title: const Text('Desktop Navigation')),
          body: Row(
            children: [
              NavigationRail(
                selectedIndex: selected,
                onDestinationSelected: (i) => setState(() => selected = i),
                destinations: const [
                  NavigationRailDestination(icon: Icon(Icons.home), label: Text('Home')),
                  NavigationRailDestination(icon: Icon(Icons.search), label: Text('Search')),
                  NavigationRailDestination(icon: Icon(Icons.person), label: Text('Profile')),
                ],
              ),
              const VerticalDivider(width: 1),
              Expanded(child: content),
            ],
          ),
        );
      },
    );
  }
}

