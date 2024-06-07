import 'package:equatable/equatable.dart';
import 'package:todo_app/bloc/todo.dart';

@immutable
abstract class TodosEvent extends Equatable {
  TodosEvent([List props = const []]) : super(props);
}

class LoadTodos extends TodosEvent {
  @override
  String toString() => 'LoadTodos';
}

class AddTodo extends TodosEvent {
  final Todo todo;

  AddTodo(this.todo) : super([todo]);

  @override
  String toString() => 'AddTodo { todo: $todo }';
}

class UpdateTodo extends TodosEvent {
  final Todo todo;

  UpdateTodo(this.todo) : super([todo]);

  @override
  String toString() => 'UpdateTodo { updatedTodo: $todo }';
}

class RemoveTodo extends TodosEvent {
  final Todo todo;

  RemoveTodo(this.todo) : super([todo]);

  @override
  String toString() => RemoveTodo { todo: $todo }';
}

class ToggleTodo extends TodosEvent {
  final Todo todo;

  ToggleTodo(this.todo) : super([todo]);

  @override
  String toString() => 'ToggleTodo { todo: $todo }';
}

class ClearAllTodos extends TodosEvent {
  @override  
  String toString()=> "ClearAllTodos";
}
