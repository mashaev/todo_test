import 'package:flutter/material.dart';
import 'package:todo_task/home_page.dart';
import 'package:todo_task/screen/add_task.dart';
import 'package:todo_task/widgets/no_internet.dart';

class RouterGlobal {
  RouterGlobal._();
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case 'add_task':
        return MaterialPageRoute(builder: (_) => const AddTask());
      case 'noInternet':
        return MaterialPageRoute(builder: (_) => const NoInternet());
      default:
        null;
    }
    return null;
  }
}
