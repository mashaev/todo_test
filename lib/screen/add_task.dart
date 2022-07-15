import 'package:flutter/material.dart';
import 'package:todo_task/utils/app_colors.dart';

import '../widgets/submit_button.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _deadLineController = TextEditingController();
  TextEditingController _startTimeController = TextEditingController();
  TextEditingController _endTimeController = TextEditingController();
  TextEditingController _remindController = TextEditingController();
  TextEditingController _repeatController = TextEditingController();

  void validateAndSave() {
    final FormState form = _formKey.currentState!;
    if (form.validate()) {
      print('Form is valid');
    } else {
      print('Form is invalid');
    }
    if (form.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.white,
          content: Text(
            'Validation Successful',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      );
    }
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
                        decoration: const InputDecoration(
                          labelText: '2021-02-28',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        obscureText: true,
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
