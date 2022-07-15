import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_task/bloc/todo_bloc.dart';
import 'package:todo_task/navigation/router_global.dart';
import 'package:todo_task/service/api_service.dart';

import 'home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //session = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    String initialPage = '/';
    return MultiBlocProvider(
      providers: [
        BlocProvider<TodoBloc>(
          create: (_) => TodosBlocImpl(service: ApiService()),
        ),
      ],
      child: MaterialApp(
        onGenerateRoute: RouterGlobal.generateRoute,
        initialRoute: initialPage,
        debugShowCheckedModeBanner: false,
        title: 'Todo Task',
        home: const HomePage(),
      ),
    );
  }
}
