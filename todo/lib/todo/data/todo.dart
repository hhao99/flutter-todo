import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  final String id;
  final String task;
  final String notes;
  final bool completed;

  const Todo(
      {required this.id,
      required this.task,
      this.notes = '',
      this.completed = false});

  Todo copyWith({String? id, String? task, String? notes, bool? completed}) {
    return Todo(
      id: id ?? this.id,
      task: task ?? this.task,
      notes: notes ?? this.notes,
      completed: completed ?? this.completed,
    );
  }

  @override
  List<Object> get props => [id, task, notes, completed];

  @override
  String toString() {
    return '[Todo] { id: $id, task: $task, notes: $notes, completed: $completed}';
  }
}
