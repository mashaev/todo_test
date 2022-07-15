import 'package:flutter/material.dart';

import '../model/todo.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;
  const TodoWidget({Key? key, required this.todo}) : super(key: key);

  Color get isColorStatus {
    if (todo.status == 'completed') {
      return Colors.green;
    } else if (todo.status == 'pending') {
      return Colors.yellow;
    }
    return Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 25,
            width: 25,
            decoration: BoxDecoration(
              border: Border.all(
                color: isColorStatus,
              ),
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(child: Text(todo.title)),
        ],
      ),
    );
  }
}
