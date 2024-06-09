part of 'todo_bloc.dart';

@immutable
abstract class TodosState extends Equatable {
  const TodosState();

  @override
  List<Object> get props => [];
}

class TodosLoading extends TodosState {}

class TodosLoaded extends TodosState {
  final List<Todo> todos;

  const TodosLoaded({this.todos = const <Todo>[]});

  @override
  List<Object> get props => [todos];
}

class TodosLoadFailure extends TodosState {
  final String message;
  const TodosLoadFailure(this.message);

  @override
  List<Object> get props => [message];
}
