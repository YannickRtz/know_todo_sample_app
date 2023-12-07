import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:know_todo/features/todos/ui/add_todo_screen.dart';
import 'package:know_todo/features/todos/ui/todo_list_screen.dart';

class AppRootLocation extends BeamLocation<BeamState> {
  @override
  List<Pattern> get pathPatterns => ['/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('todolist'),
          child: TodoListScreen(),
        ),
        if (state.uri.pathSegments.contains('new'))
          const BeamPage(
            key: ValueKey('newtodo'),
            child: AddTodoScreen(),
          ),
      ];
}
