class Task {
  Task(this.id, this.title, this.desc);
  int id;
  String title;
  String desc;
  static today() {
    List<Task> lists = [];
    // for (var i = 0; i < 100; i++) {
    //   lists.add(Task(i, "今天-$i", "今天-desc $i"));
    // }
    return lists;
  }

  static tomorrow() {
    List<Task> lists = [];
    for (var i = 0; i < 100; i++) {
      lists.add(Task(i, "明天-$i", "# 明天-desc $i \n * 111\n* 222"));
    }
    return lists;
  }

  static all() {
    List<Task> lists = [];
    for (var i = 0; i < 100; i++) {
      lists.add(Task(i, "收集箱-$i", "收集箱-desc $i"));
    }
    return lists;
  }
}
