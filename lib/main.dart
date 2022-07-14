import 'package:flutter/material.dart';
import 'package:todo_task/navigation/router_global.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    String initialPage = '/';
    return MaterialApp(
      onGenerateRoute: RouterGlobal.generateRoute,
      initialRoute: initialPage,
      debugShowCheckedModeBanner: false,
      title: 'Todo Task',
      home: const HomePage(),
    );
  }
}
