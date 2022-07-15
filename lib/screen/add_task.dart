import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_task/utils/app_colors.dart';

import '../bloc/todo_bloc.dart';
import '../model/todo.dart';
import '../widgets/submit_button.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _deadLineController = TextEditingController();
  final TextEditingController _startTimeController = TextEditingController();
  final TextEditingController _endTimeController = TextEditingController();
  final TextEditingController _remindController = TextEditingController();
  final TextEditingController _repeatController = TextEditingController();

  void validateAndSave() async {
    final FormState form = _formKey.currentState!;

    if (form.validate()) {
      Random random = Random();
      int randomNumber = random.nextInt(100);
      Map<String, dynamic> saveTodo = {
        "id": randomNumber,
        "user_id": randomNumber,
        "title": _titleController.text,
        "due_on": _startTimeController.text + '-' + _endTimeController.text,
        "status": 'pending'
      };

      String encodedMap = json.encode(saveTodo);
      SharedPreferences session = await SharedPreferences.getInstance();
      session.setString('todo', encodedMap);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.white,
          content: Text(
            'Validation Successful',
            style: TextStyle(
              color: Colors.green,
            ),
          ),
        ),
      );
      _clear();
      String? getMap = session.getString('todo');
      if (getMap != null) {
        Map<String, dynamic> decodedMap = json.decode(getMap);

        BlocProvider.of<TodoBloc>(context).addTodo(Todo.fromJson(decodedMap));

        Navigator.of(context).pop();
      }
    } else {
      FocusScope.of(context).unfocus();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.black,
          content: Text(
            'Validation is not complete',
            style: TextStyle(
              color: Colors.red,
            ),
          ),
        ),
      );
    }
  }

  void _clear() {
    _titleController.clear();
    _deadLineController.clear();
    _startTimeController.clear();
    _endTimeController.clear();
    _remindController.clear();
    _repeatController.clear();
  }

  @override
  void dispose() {
    super.dispose();

    _titleController.dispose();
    _deadLineController.dispose();
    _startTimeController.dispose();
    _endTimeController.dispose();
    _remindController.dispose();
    _repeatController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: false,
        backgroundColor: AppColor.primaryTextColor,
        title: const Text(
          'Add Task',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Title',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                      child: TextFormField(
                        controller: _titleController,
                        decoration: const InputDecoration(
                          labelText: 'Design team meeting',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        validator: (value) =>
                            value!.isEmpty ? 'title cannot be blank' : null,
                      ),
                    ),
                    const Text(
                      'DeadLine',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                      child: TextFormField(
                        controller: _deadLineController,
                        keyboardType: TextInputType.datetime,
                        decoration: const InputDecoration(
                          labelText: '2021-02-28',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        validator: (value) =>
                            value!.isEmpty ? 'deadLine cannot be blank' : null,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Start Time',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: 150,
                                height: 100,
                                child: TextFormField(
                                  controller: _startTimeController,
                                  keyboardType: TextInputType.datetime,
                                  decoration: const InputDecoration(
                                    labelText: '11:00 Am',
                                    suffixIcon: Icon(Icons.timer),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  validator: (value) => value!.isEmpty
                                      ? 'start Time cannot be blank'
                                      : null,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'End Time',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: 150,
                                height: 100,
                                child: TextFormField(
                                  controller: _endTimeController,
                                  keyboardType: TextInputType.datetime,
                                  decoration: const InputDecoration(
                                    labelText: '14:00 Pm',
                                    suffixIcon: Icon(Icons.timer),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  validator: (value) => value!.isEmpty
                                      ? 'end Time cannot be blank'
                                      : null,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Text(
                      'Remind',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                      child: TextFormField(
                        controller: _remindController,
                        decoration: const InputDecoration(
                          labelText: '10 minutes early',
                          suffixIcon: Icon(Icons.arrow_drop_down_sharp),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        validator: (value) =>
                            value!.isEmpty ? 'remind cannot be blank' : null,
                      ),
                    ),
                    const Text(
                      'Repeat',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                      child: TextFormField(
                        controller: _repeatController,
                        decoration: const InputDecoration(
                          labelText: 'Weekly',
                          suffixIcon: Icon(Icons.arrow_drop_down_sharp),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        validator: (value) =>
                            value!.isEmpty ? 'Weekly cannot be blank' : null,
                      ),
                    ),
                  ]),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 30,
            right: 30,
            child: SubmitButton(
                text: 'Create a task',
                onPresd: () {
                  validateAndSave();
                }),
          ),
        ],
      ),
    );
  }
}
