// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:todos_api/src/models/todo.dart';

/// {@template todos_api}
/// The interface and models for an API providing access to todos.
/// {@endtemplate}
abstract class TodosApi {
  /// {@macro todos_api}
  const TodosApi();

  ///Get Todos in the Form of a Stream
  Stream<List<Todo>> getTodos();

  ///Save a given Todo
  Future<void> saveTodo(Todo todo);

  ///Delete a given Todo
  Future<void> deleteTodo(String id);

  ///Clear Completed todos, returns the number of Todos cleared.
  Future<int> clearCompleted();

  ///Complete all Todos
  Future<int> completeAll({required bool isCompleted});
}

///Exception if given Todo is not Found
class TodoNotFoundException implements Exception {}
