import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:knowunity_todo/features/todos/domain/controller/todos_controller.dart';
import 'package:knowunity_todo/features/todos/domain/models/todo.dart';

class AddTodoScreen extends ConsumerStatefulWidget {
  const AddTodoScreen({Key? key}) : super(key: key);

  @override
  AddTodoScreenState createState() => AddTodoScreenState();
}

class AddTodoScreenState extends ConsumerState<AddTodoScreen> {
  late TextEditingController _textEditingController;
  String _newTodoTitle = '';

  @override
  void initState() {
    _textEditingController = TextEditingController();
    _textEditingController.text = _newTodoTitle;
    _textEditingController.addListener(() {
      setState(() {
        _newTodoTitle = _textEditingController.text;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(AppLocalizations.of(context).add_new_todo),
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                context.beamBack();
              })),
      body: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          const Checkbox(
            value: false,
            onChanged: null,
          ),
          Expanded(
            child: TextFormField(
              autofocus: true,
              controller: _textEditingController,
            ),
          ),
          SizedBox.fromSize(size: const Size(20, 0)),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        disabledElevation: 0,
        onPressed: _newTodoTitle.isEmpty
            ? null
            : () {
                ref.read(todosProvider.notifier).addTodo(Todo(
                      id: 0, // Will be determined by server
                      title: _newTodoTitle,
                    ));
                context.beamBack();
              },
        label: Text(AppLocalizations.of(context).add_todo),
        icon: const Icon(Icons.check),
      ),
    );
  }
}
