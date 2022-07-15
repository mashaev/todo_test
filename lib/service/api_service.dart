import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_task/model/todo.dart';

class ApiService {
  Future getTodos() async {
    String url = 'https://gorest.co.in/public/v2/todos';
    List<Todo> todos = [];
    try {
      var response = await http.get(Uri.parse(url));
      var values = json.decode(response.body);
      if (response.statusCode == 200) {
        values.forEach((val) {
          todos.add(Todo.fromJson(val));
        });

        SharedPreferences session = await SharedPreferences.getInstance();
        String? encodedMap = session.getString('todo');
        if (encodedMap != null) {
          Map<String, dynamic> decodedMap = json.decode(encodedMap);
          todos.add(Todo.fromJson(decodedMap));
        }

        return todos;
      }
    } catch (error) {
      print(error);
    }
  }
}
