import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoNotifier extends StateNotifier<List<Map<String, dynamic>>> {
  TodoNotifier(super.state);
  addTodo(value) {
    state = [
      ...state,
      {"title": value, "isDone": false, "id": DateTime.now().toIso8601String()}
    ];
  }

  deleteTodo(id) {
    state = state.where((item) => item["id"] != id).toList();
  }

  toggleDone(id) {
    state = state.map((item) {
      if (item["id"] == id) {
        return {...item, "isDone": !item["isDone"]};
      } else {
        return item;
      }
    }).toList();
  }
}

final todoNotifier =
    StateNotifierProvider<TodoNotifier, List<Map<String, dynamic>>>(
        (ref) => TodoNotifier(List.of([])));
