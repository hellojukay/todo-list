class Task {
  Task(this.id, this.title, this.desc, this.finished);
  int id;
  String title;
  String desc;
  bool finished;

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(json['id'] as int, json['title'] as String,
        json['desc'] as String, json['finished']);
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "title": title, "desc": desc, "finished": finished};
  }
}
