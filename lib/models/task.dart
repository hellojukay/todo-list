class Task {
  Task(this.id, this.title, this.desc);
  int id;
  String title;
  String desc;
  static all() {
    List<Task> lists = [];
    for (var i = 0; i < 100; i++) {
      lists.add(Task(i, "task-" + i.toString(), "desc " + i.toString()));
    }
    return lists;
  }
}
