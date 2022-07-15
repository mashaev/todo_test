import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_task/bloc/todo_bloc.dart';
import 'package:todo_task/bloc/todos_state.dart';

class TabCategory extends StatefulWidget {
  final String? text;
  // ignore: prefer_const_constructors_in_immutables
  TabCategory({
    Key? key,
    this.text,
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
      }
      if (state is TodosLoadedState) {
        state.todos;
      }
      return Column(
        children: [
          Center(child: Text(widget.text ?? '')),
        ],
      );
    });
  }
}
