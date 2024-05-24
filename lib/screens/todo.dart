import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/state/todo.dart';
import 'package:todo/widgets/todo_item.dart';

class Todo extends ConsumerStatefulWidget {
  const Todo({super.key});

  @override
  ConsumerState<Todo> createState() => _TodoState();
}

class _TodoState extends ConsumerState<Todo> {
  @override
  Widget build(BuildContext context) {
    final List todos = ref.watch(todoNotifier).toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todos List"),
        centerTitle: true,
        actions: [
          IconButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onPressed: () {
              Navigator.of(context).pushNamed("/add-todo");
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: SafeArea(
        child: todos.isEmpty
            ? const Center(
                child: Text(
                  "No todos yet. Tap on + icon to add todo",
                ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                child: ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    return TodoItem(ref: ref, todo: todos[index]);
                  },
                ),
              ),
      ),
    );
  }
}
