import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

class Todo {
  final String title;
  final bool completed;

  const Todo(this.title, {this.completed = false});

  Todo copyWith({String? title, bool? completed}) {
    return Todo(
      title ?? this.title,
      completed: completed ?? this.completed,
    );
  }
}

class TodoNotifier extends StateNotifier<List<Todo>> {
  TodoNotifier() : super(const []);

  void add(String title) {
    if (title.trim().isEmpty) return;
    state = [...state, Todo(title.trim())];
  }

  void remove(int index) {
    final updated = [...state]..removeAt(index);
    state = updated;
  }

  void toggle(int index) {
    final updated = [...state];
    updated[index] = updated[index].copyWith(
      completed: !updated[index].completed,
    );
    state = updated;
  }
}

final todoProvider =
    StateNotifierProvider<TodoNotifier, List<Todo>>((ref) => TodoNotifier());

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoScreen(),
    );
  }
}

class TodoScreen extends ConsumerStatefulWidget {
  const TodoScreen({super.key});

  @override
  ConsumerState<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends ConsumerState<TodoScreen> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final todos = ref.watch(todoProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Riverpod Todo')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(labelText: 'Todo'),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    ref.read(todoProvider.notifier).add(controller.text);
                    controller.clear();
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return ListTile(
                  leading: Checkbox(
                    value: todo.completed,
                    onChanged: (_) =>
                        ref.read(todoProvider.notifier).toggle(index),
                  ),
                  title: Text(
                    todo.title,
                    style: TextStyle(
                      decoration: todo.completed
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () =>
                        ref.read(todoProvider.notifier).remove(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
