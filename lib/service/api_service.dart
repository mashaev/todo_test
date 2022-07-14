import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  ApiService._();
  static Future getTodos() async {
    String url = 'https://gorest.co.in/public/v2/todos';
    try {
      //cprint('request getPages $url');
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        print(
            'json getCharts decode response is: ${json.decode(response.body)}');

        //cprint('json getPages: ${json.decode(response.body).length}');

        return json.decode(response.body);
      } else {
        //cprint('getPages -error ${response.headers}');
      }
    } catch (error) {
      print(error);
    }
  }
}
