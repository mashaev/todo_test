import 'package:flutter/material.dart';
import 'package:todo_task/home_page.dart';
import 'package:todo_task/widgets/no_internet.dart';

class RouterGlobal {
  RouterGlobal._();
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case 'noInternet':
        return MaterialPageRoute(builder: (_) => NoInternet());
      default:
        null;
    }
  }
}
