import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:todo_task/service/api_service.dart';

import 'todos_state.dart';

abstract class TodoBloc extends Cubit<TodosState> {
  TodoBloc(TodosState state) : super(state);
  Future getTodos();
}

class TodosBlocImpl extends TodoBloc {
  ApiService service;
  TodosBlocImpl({required this.service}) : super(TodosInitialState());
  @override
  Future getTodos() async {
    emit(TodosLoadingState());
    final serviceTodos = await service.getTodos();
    emit(TodosLoadedState(todos: serviceTodos));

    //throw UnimplementedError();
  }
}
