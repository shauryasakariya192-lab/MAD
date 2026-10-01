import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NestedNavigationScreen(),
    );
  }
}

class NestedNavigationScreen extends StatefulWidget {
  const NestedNavigationScreen({super.key});

  @override
  State<NestedNavigationScreen> createState() => _NestedNavigationScreenState();
}

class _NestedNavigationScreenState extends State<NestedNavigationScreen> {
  int selectedIndex = 0;

  final List<GlobalKey<NavigatorState>> navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  Widget buildTabNavigator(int index) {
    return Navigator(
      key: navigatorKeys[index],
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (_) => TabHomeScreen(
            title: index == 0 ? 'Home Tab' : 'Profile Tab',
            tabIndex: index,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: [
          buildTabNavigator(0),
          buildTabNavigator(1),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) => setState(() => selectedIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class TabHomeScreen extends StatelessWidget {
  final String title;
  final int tabIndex;

  const TabHomeScreen({
    super.key,
    required this.title,
    required this.tabIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => DetailsScreen(tabIndex: tabIndex),
              ),
            );
          },
          child: const Text('Open Details'),
        ),
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  final int tabIndex;

  const DetailsScreen({super.key, required this.tabIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tab Details')),
      body: Center(
        child: Text('Details for tab ${tabIndex + 1}'),
      ),
    );
  }
}
