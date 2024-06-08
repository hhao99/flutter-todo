part of 'todo_cubit.dart';

abstract class TodoState {
  const TodoState();
}

class TodoStateInitial extends TodoState {
  const TodoStateInitial();
}

class TodoStateLoading extends TodoState {
  const TodoStateLoading();
}

class TodoStateLoaded extends TodoState {
  final List<Todo> todos;
  const TodoStateLoaded(this.todos);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is TodoStateLoaded && o.todos == todos;
  }

  @override
  int get hashCode => todos.hashCode;
}

class TodoStateLoadFailure extends TodoState {
  final String message;
  const TodoStateLoadFailure(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is TodoStateLoadFailure && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
