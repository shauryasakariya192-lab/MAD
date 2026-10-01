import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeModel extends ChangeNotifier {
  bool darkMode = false;

  ThemeMode get mode => darkMode ? ThemeMode.dark : ThemeMode.light;

  void toggle() {
    darkMode = !darkMode;
    notifyListeners();
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeModel>();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: theme.mode,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const ThemeScreen(),
    );
  }
}

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = context.watch<ThemeModel>().darkMode;

    return Scaffold(
      appBar: AppBar(title: const Text('Theme Switcher')),
      body: Center(
        child: SwitchListTile(
          title: Text(dark ? 'Dark Mode' : 'Light Mode'),
          value: dark,
          onChanged: (_) => context.read<ThemeModel>().toggle(),
        ),
      ),
    );
  }
}
