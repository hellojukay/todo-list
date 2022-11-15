import 'dart:convert';

class Task {
  Task(this.id, this.title, this.desc);
  int id;
  String title;
  String desc;

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
        json['id'] as int, json['title'] as String, json['desc'] as String);
  }
}
