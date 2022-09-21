// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

/// {@template todos_repository}
/// A repository that handles todo related requests.
/// {@endtemplate}

import 'package:todos_api/todos_api.dart';

class TodosRepository {
  /// {@macro todos_repository}
  const TodosRepository({required TodosApi todosApi}) : _todosApi = todosApi;

  final TodosApi _todosApi;

  ///Provides a Stream of all Todos
  Stream<List<Todo>> getTodos() => _todosApi.getTodos();

  ///Saves a given Todo, if Todo of same ID already exists, it will be replaced
  Future<void> saveTodo(Todo todo) => _todosApi.saveTodo(todo);

  ///Deletes the todo with the given ID.
  Future<void> deleteTodo(String id) => _todosApi.deleteTodo(id);

  ///Deletes Completed Todos
  ///Returns the number of deleted todos.
  Future<int> clearCompleted() => _todosApi.clearCompleted();

  ///Sets the isCompleted state of all todos to the given value
  ///
  ///Returns the number of updated Todos.
  Future<int> completeAll({required bool isCompleted}) =>
      _todosApi.completeAll(isCompleted: isCompleted);
}
