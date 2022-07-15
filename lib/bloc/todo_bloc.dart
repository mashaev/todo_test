import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:todo_task/service/api_service.dart';

import '../model/todo.dart';
import 'todos_state.dart';

abstract class TodoBloc extends Cubit<TodosState> {
  TodoBloc(TodosState state) : super(state);
  Future getTodos();
  void addTodo(Todo todo);
}

class TodosBlocImpl extends TodoBloc {
  ApiService service;
  List<Todo> todos = [];
  TodosBlocImpl({required this.service}) : super(TodosInitialState());
  @override
  Future getTodos() async {
    emit(TodosLoadingState());
    final serviceTodos = await service.getTodos();
    if (serviceTodos != null) {
      todos = serviceTodos;
      emit(TodosLoadedState(todos: todos));
    }
  }

  @override
  void addTodo(Todo todo) async {
    emit(TodosLoadingState());
    todos.add(todo);
    emit(TodosLoadedState(todos: todos));
  }
}
