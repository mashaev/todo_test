import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_task/bloc/todo_bloc.dart';
import 'package:todo_task/bloc/todos_state.dart';
import 'package:todo_task/widgets/todo_widget.dart';

class TabCategory extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  TabCategory({
    Key? key,
  }) : super(key: key);

  @override
  State<TabCategory> createState() => _TabCategoryState();
}

class _TabCategoryState extends State<TabCategory> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodosState>(builder: (context, state) {
      if (state is TodosLoadingState) {
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.black,
          ),
        );
      } else if (state is TodosLoadedState) {
        return SingleChildScrollView(
          child: Column(
            children: List.generate(state.todos.length,
                (index) => TodoWidget(todo: state.todos[index])),
          ),
        );
      }
      return const SizedBox();
    });
  }
}
