import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:knowunity_todo/features/todos/ui/todo_list.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Knowunity Todos')),
      body: const TodoList(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.beamToNamed('/new');
        },
        label: const Text('Add Todo'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
