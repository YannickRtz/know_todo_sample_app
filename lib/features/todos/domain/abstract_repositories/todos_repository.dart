import 'package:knowunity_todo/features/todos/domain/models/todo.dart';

abstract class TodosRepository {
  Future<List<Todo>> fetchTodos();
  Future<void> updateTodo(Todo todo);
  Future<void> deleteTodo(Todo todo);
  Future<void> addTodo(Todo todo);
}
