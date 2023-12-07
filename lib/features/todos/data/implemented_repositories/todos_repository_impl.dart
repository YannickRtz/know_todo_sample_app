import 'dart:io';

import 'package:dio/dio.dart';
import 'package:knowunity_todo/features/todos/domain/abstract_repositories/todos_repository.dart';
import 'package:knowunity_todo/features/todos/domain/models/todo.dart';
import 'package:knowunity_todo/utils/dio_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todos_repository_impl.g.dart';

class JsonPlaceholderTodosRepositoryImpl implements TodosRepository {
  JsonPlaceholderTodosRepositoryImpl({required this.dio});

  final Dio dio;

  @override
  Future<void> addTodo(Todo todo) async {
    final url = Uri(
      scheme: 'https',
      host: 'jsonplaceholder.typicode.com',
      path: 'todos',
    ).toString();
    final response = await dio.post(
      url,
      data: todo.toJson(),
    );
    if (response.statusCode != 200) {
      throw HttpException('Status: ${response.statusCode}');
    }
  }

  @override
  Future<void> deleteTodo(Todo todo) async {
    // TODO: implement deleteTodo
    throw UnimplementedError();
  }

  @override
  Future<List<Todo>> fetchTodos() async {
    final url = Uri(
      scheme: 'https',
      host: 'jsonplaceholder.typicode.com',
      path: 'todos',
    ).toString();
    // Artificial delay to show loading spinner:
    await Future.delayed(const Duration(seconds: 2));
    final response = await dio.get(url);
    if (response.statusCode == 200) {
      final todos = response.data as List<dynamic>;
      return todos
          .map((t) => Todo.fromJson(t))
          .where((t) => t.userId == 1) // TODO: User Management
          .toList();
    } else {
      throw HttpException('Status: ${response.statusCode}');
    }
  }

  @override
  Future<void> updateTodo(Todo todo) async {
    final url = Uri(
      scheme: 'https',
      host: 'jsonplaceholder.typicode.com',
      path: 'todos/${todo.id}',
    ).toString();
    final response = await dio.put(
      url,
      data: todo.toJson(),
    );
    if (response.statusCode != 200) {
      throw HttpException('Status: ${response.statusCode}');
    }
  }
}

@riverpod
TodosRepository jsonPlaceholderTodosRepositoryImpl(
    JsonPlaceholderTodosRepositoryImplRef ref) {
  final dio = ref.watch(dioProvider);
  return JsonPlaceholderTodosRepositoryImpl(dio: dio);
}
