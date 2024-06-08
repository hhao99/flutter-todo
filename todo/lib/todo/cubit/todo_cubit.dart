import 'package:bloc/bloc.dart';
import 'dart:async';
// import 'package:equatable/equatable.dart';
import 'package:todo_app/todo/models/model.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  final TodoRepository _TodoRepository;
  TodoCubit(this._TodoRepository) : super(TodoStateInitial());

  Future<void> loadTodos() async {
    try {
      emit(const TodoStateLoading());
      const todos = [
        const Todo(id: 'fake_1', task: 'first task'),
        const Todo(id: 'fake_2', task: 'second task'),
        const Todo(id: 'fake_3', task: 'third task')
      ];
      emit(const TodoStateLoaded(todos));
    } catch (_) {
      emit(const TodoStateLoadFailure("todos load failed"));
    }
  }
}
