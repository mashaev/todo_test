import 'package:flutter/material.dart';
import 'package:todo_task/widgets/submit_button.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('no internet'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text('Нет интернет-соединения.'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SubmitButton(
                text: 'Повторить',
                onPresd: () {
                  Navigator.of(context).pushNamed('/');
                }),
          ),
        ],
      ),
    );
  }
}
