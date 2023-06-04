import 'package:knowunity_todo/features/todos/data/implemented_repositories/todos_repository_impl.dart';
import 'package:knowunity_todo/features/todos/domain/models/todo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todos_controller.g.dart';

@riverpod
class Todos extends _$Todos {
  @override
  FutureOr<List<Todo>> build() async {
    final todosRepo = ref.read(jsonPlaceholderTodosRepositoryImplProvider);
    return todosRepo.fetchTodos();
  }

  Future<void> addTodo(Todo todo) async {
    // To keep the UI responsive, update data in memory first:
    state = AsyncValue.data([...?state.value, todo]);
    // TODO: Handle network issues
    final todosRepo = ref.read(jsonPlaceholderTodosRepositoryImplProvider);
    await todosRepo.addTodo(todo);
  }

  Future<void> removeTodo(Todo todo) async {
    state = AsyncValue.data(
        [...?state.value].where((t) => t.id != todo.id).toList());
    final todosRepo = ref.read(jsonPlaceholderTodosRepositoryImplProvider);
    todosRepo.deleteTodo(todo);
  }

  Future<void> toggle(Todo todo) async {
    final updatedTodo = todo.copyWith(completed: !todo.completed);
    state = AsyncValue.data([...?state.value]
        .map((t) => t.id == todo.id ? updatedTodo : t)
        .toList());
    final todosRepo = ref.read(jsonPlaceholderTodosRepositoryImplProvider);
    todosRepo.updateTodo(updatedTodo);
  }
}
