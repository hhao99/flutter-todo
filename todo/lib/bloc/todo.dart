import 'package:uuid/uuid.dart';
import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  final String id;
  final String task;
  final bool done;

  Todo(this.task, this.id, {String id, this.done = false})
      : this.id = id ?? Uuid().v4(),
        super([id, task, done]);

  Todo copyWith({bool done, String id, String task}) {
    return Todo(
      task ?? this.task,
      done: done ?? this.done,
      id: id ?? this.id,
    );
  }

  @override
  String toString() {
    return 'Todo { task: $task, done: $done, id: $id }';
  }
}
