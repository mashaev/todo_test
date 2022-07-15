import 'package:equatable/equatable.dart';
import 'package:todo_task/model/todo.dart';

abstract class TodosState extends Equatable {
  const TodosState();

  @override
  List<Object?> get props => [];
}

class TodosInitialState extends TodosState {}

class TodosLoadingState extends TodosState {}

class TodosLoadedState extends TodosState {
  final List<Todo> todos;

  const TodosLoadedState({
    required this.todos,
  });

  int get length => todos.length;
  bool get isNotEmpty => todos.isNotEmpty;

  @override
  List<Object?> get props => [
        todos,
      ];
}
