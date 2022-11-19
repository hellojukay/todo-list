import 'dart:convert';

import 'package:flutter/foundation.dart';
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

addTask(String title) async {
  var client = http.Client();
  try {
    var response = await client
        .post(Uri.http('localhost:5000', '/todo/'), body: {"title": title});
    var json = jsonDecode(utf8.decode(response.bodyBytes));
    return Task.fromJson(json);
  } finally {
    client.close();
  }
}

removeTask(int id) async {
  var client = http.Client();
  try {
    await client.delete(Uri.http('localhost:5000', "/todo/$id"));
    return true;
  } finally {
    client.close();
  }
}

updateTask(Task task) async {
  if (kDebugMode) {
    print("update task ${task.id} ${task.title} ${task.finished}");
  }
  var client = http.Client();
  try {
    await client.put(Uri.http('localhost:5000', "/todo/${task.id}"),
        body: jsonEncode(task));
    return true;
  } finally {
    client.close();
  }
}
