import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:todo/todo/todo.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodosEvent, TodosState> {
  TodoBloc() : super(TodosLoading()) {
    on<LoadTodos>((LoadTodos event, Emitter<TodosState> emit) {
      emit(TodosLoaded(todos: event.todos));
    });

    if (this.state is TodosLoaded) {
      on<AddTodo>((AddTodo event, Emitter<TodosState> emit) {
        final state = this.state;
        if (state is TodosLoaded) {
          emit(TodosLoaded(todos: List.from(state.todos)..add(event.todo)));
        }
      });
      on<UpdateTodo>((UpdateTodo event, Emitter<TodosState> emit) {
        final state = this.state;
        if (state is TodosLoaded) {
          List<Todo> todos = state.todos
              .map((todo) => todo.id == event.todo.id ? event.todo : todo)
              .toList();
          emit(TodosLoaded(todos: todos));
        }
      });

      on<RemoveTodo>((RemoveTodo event, Emitter<TodosState> emit) {
        final state = this.state;
        if (state is TodosLoaded) {
          final todos =
              state.todos.where((todo) => todo.id != event.id).toList();
          emit(TodosLoaded(todos: todos));
        }
      });
      on<ClearCompleted>((ClearCompleted event, Emitter<TodosState> emit) {
        final state = this.state;
        if (state is TodosLoaded) {
          List<Todo> todos =
              state.todos.where((todo) => !todo.completed).toList();
          emit(TodosLoaded(todos: todos));
        }
      });
    }
  }
}
