import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todo_task/model/todo.dart';

class ApiService {
  Future getTodos() async {
    String url = 'https://gorest.co.in/public/v2/todos';
    List<Todo> todos = [];
    try {
      //cprint('request getPages $url');
      var response = await http.get(Uri.parse(url));
      var values = json.decode(response.body);
      if (response.statusCode == 200) {
        print('json getTodos decode response is: $values');
        values.forEach((val) {
          todos.add(Todo.fromJson(val));
        });
        return todos;
      }
    } catch (error) {
      print(error);
    }
  }
}
