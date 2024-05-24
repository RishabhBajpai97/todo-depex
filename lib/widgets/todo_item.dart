import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/state/todo.dart';

class TodoItem extends StatelessWidget {
  final dynamic todo;
  final WidgetRef ref;
  const TodoItem({
    super.key,
    required this.ref,
    required this.todo,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.none,
      child: ListTile(
        title: Text(
          todo["title"],
          style: TextStyle(
              decoration: todo["isDone"]
                  ? TextDecoration.lineThrough
                  : TextDecoration.none),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
                onPressed: () {
                  ref
                      .read(todoNotifier.notifier)
                      .toggleDone(todo["id"]);
                },
                icon: Icon(todo["isDone"]
                    ? Icons.check_box
                    : Icons.check_box_outline_blank,)),
            IconButton(
                onPressed: () {
                  
                  ref
                      .read(todoNotifier.notifier)
                      .deleteTodo(todo["id"]);
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ))
          ],
        ),
      ),
    );
  }
}
