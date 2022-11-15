import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todo_list/models/task.dart';

Future<List<Task>> loadTask() async {
  var client = http.Client();
  try {
    var response = await client.get(Uri.http('localhost:5000', '/todo/'));
    List<dynamic> list =
        jsonDecode(utf8.decode(response.bodyBytes)) as List<dynamic>;
    return list.map((e) => Task.fromJson(e)).toList();
  } finally {
    client.close();
  }
}
