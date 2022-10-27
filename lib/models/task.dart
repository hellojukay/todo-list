class Task {
  Task(this.id, this.title, this.desc);
  int id;
  String title;
  String desc;
  static today() {
    List<Task> lists = [];
    for (var i = 0; i < 100; i++) {
      lists.add(Task(i, "今天-" + i.toString(), "今天-desc " + i.toString()));
    }
    return lists;
  }

  static tomorrow() {
    List<Task> lists = [];
    for (var i = 0; i < 100; i++) {
      lists.add(Task(i, "明天-" + i.toString(), "明天-desc " + i.toString()));
    }
    return lists;
  }

  static all() {
    List<Task> lists = [];
    for (var i = 0; i < 100; i++) {
      lists.add(Task(i, "收集箱-" + i.toString(), "收集箱-desc " + i.toString()));
    }
    return lists;
  }
}
