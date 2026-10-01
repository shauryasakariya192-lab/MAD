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


class TodoList extends StatefulWidget {
  final List<String> items;
  const TodoList({super.key, required this.items});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  late List<String> items;
  final Set<String> completed = {};

  @override
  void initState() {
    super.initState();
    items = List.from(widget.items);
    print('initState');
  }

  @override
  void didUpdateWidget(covariant TodoList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.items != widget.items) {
      items = List.from(widget.items);
    }
    print('didUpdateWidget');
  }

  void addItem() {
    setState(() => items.add('Task ${items.length + 1}'));
  }

  void removeItem(int index) {
    setState(() {
      completed.remove(items[index]);
      items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
        actions: [IconButton(onPressed: addItem, icon: const Icon(Icons.add))],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            leading: Checkbox(
              value: completed.contains(item),
              onChanged: (value) => setState(() {
                value == true ? completed.add(item) : completed.remove(item);
              }),
            ),
            title: Text(
              item,
              style: TextStyle(decoration: completed.contains(item) ? TextDecoration.lineThrough : null),
            ),
            trailing: IconButton(icon: const Icon(Icons.delete), onPressed: () => removeItem(index)),
          );
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const TodoList(items: ['Study Flutter', 'Practice Dart', 'Upload to GitHub']);
  }
}

