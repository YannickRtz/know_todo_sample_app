import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:knowunity_todo/features/todos/ui/todo_list.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context).knowunity_todos)),
      body: const TodoList(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.beamToNamed('/new');
        },
        label: Text(AppLocalizations.of(context).add_todo),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
