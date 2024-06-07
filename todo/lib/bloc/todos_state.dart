import 'package:equatable/equatable.dart';
import 'package:todo_app/bloc/todo.dart';

@immutable
abstract class TodosState extends Equatable {
  TodoState([List props = const []]) : super(props);
}

class TodosLoading extends TodosState {
  @override
  String toString() => 'StateLoading';
}

class TodosNotLoaded extends TodosState {
  @override 
  String toString() => 'StateNotLoaded';
}

class TodosLoaded extends TodosState {
  final List<Todo> todos;

  TodosLoaded([this.todos = const[]]): super([todos]);

  @override  
  String toString()=> 'TodosLoaded { todos: $todos }';
}
