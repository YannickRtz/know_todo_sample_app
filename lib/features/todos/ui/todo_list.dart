import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:know_todo/features/todos/domain/controller/todos_controller.dart';
import 'package:know_todo/features/todos/domain/models/todo.dart';

class TodoList extends ConsumerWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todosValue = ref.watch(todosProvider);
    return todosValue.when(
      data: (todos) {
        return ListView(
          children: todos.map((t) {
            return _buildTodo(t, ref);
          }).toList(),
        );
      },
      error: (e, _) => Text(e.toString()),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }

  ListTile _buildTodo(Todo t, WidgetRef ref) {
    return ListTile(
      leading: Checkbox(
        value: t.completed,
        onChanged: (_) => ref.read(todosProvider.notifier).toggle(t),
      ),
      title: Text(t.title),
    );
  }
}
