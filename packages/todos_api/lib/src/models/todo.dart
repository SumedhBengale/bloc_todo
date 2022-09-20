import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:todos_api/todos_api.dart';
import 'package:uuid/uuid.dart';

part 'todo.g.dart';

///JSON Serializable Map
typedef JsonMap = Map<String, dynamic>;

@immutable
@JsonSerializable()

/// {@template todo}
class Todo extends Equatable {
  /// {@macro todo}
  Todo({
    String? id,
    required this.title,
    this.description = '',
    this.isCompleted = false,
  })  : assert(
          id == null || id.isNotEmpty,
          'ID can not be null and must be Empty',
        ),
        id = id ?? const Uuid().v4();

  /// Unique Identifier of this Todo
  final String id;

  ///Title of the Todo
  final String title;

  ///Description of the Todo
  final String description;

  ///Whether the Todo is completed, defaults to false.
  final bool isCompleted;

  ///Returns a copy of this todo with the given values updated.
  Todo copyWith({
    String? id,
    String? title,
    String? description,
    bool? isCompleted,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  /// Deserializes the given [JsonMap] into a [Todo].
  static Todo fromJson(JsonMap json) => _$TodoFromJson(json);

  /// Converts this [Todo] into a [JsonMap].
  JsonMap toJson() => _$TodoToJson(this);

  @override
  List<Object?> get props => [id, title, description, isCompleted];
}
