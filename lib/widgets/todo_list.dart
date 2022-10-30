import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:todo_list/models/task.dart';

class TodoList extends StatefulWidget {
  TodoList({super.key});
  List<Task> today = Task.today();
  List<Task> tomorrow = Task.tomorrow();
  List<Task> all = Task.all();

  List<Task> tasks = [];

  @override
  State<StatefulWidget> createState() {
    return TodoListState();
  }
}

class TodoListState extends State<TodoList> {
  int currentTask = 0;
  int currentCollection = 0;

  String getDesc(int id) {
    String desc = "";
    for (var i = 0; i < widget.tasks.length; i++) {
      if (widget.tasks[i].id == id) {
        desc = widget.tasks[i].desc;
        break;
      }
    }
    return desc;
  }

  removeTask(int id, int day) {
    if (day == 0) {
      widget.today = widget.today.where((element) => element.id != id).toList();
      widget.tasks = widget.today;
    }
    if (day == 1) {
      widget.tomorrow =
          widget.tomorrow.where((element) => element.id != id).toList();
      widget.tasks = widget.tomorrow;
    }
    if (day == 2) {
      widget.all = widget.all.where((element) => element.id != id).toList();
      widget.tasks = widget.all;
    }
  }

  List<Widget> getTodoList(List<Task> tasks) {
    return tasks
        .map((e) => ListTile(
              trailing: IconButton(
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(Duration(days: 100)),
                      initialDate: DateTime.now(),
                    );
                  },
                  icon: const Icon(Icons.calendar_month)),
              leading: Checkbox(
                onChanged: (v) {
                  if (v!) {
                    setState(() {
                      removeTask(e.id, currentCollection);
                    });
                  }
                },
                value: false,
              ),
              title: TextField(
                onTap: () {
                  setState(() {
                    currentTask = e.id;
                  });
                },
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                controller: TextEditingController(text: e.title),
              ),
            ))
        .toList();
  }

  Widget getContent(int id, int day) {
    TextEditingController descController = TextEditingController();
    if (day == 0) {
      widget.tasks = widget.today;
    }
    if (day == 1) {
      widget.tasks = widget.tomorrow;
    }
    if (day == 2) {
      widget.tasks = widget.all;
    }
    descController.text = getDesc(currentTask);
    TextEditingController inputController = TextEditingController();
    return Row(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 243, 243, 243),
                    borderRadius: BorderRadius.circular(5)),
                child: SizedBox(
                    width: 350,
                    height: 40,
                    child: TextField(
                      onTap: () {
                        descController.text = "";
                      },
                      controller: inputController,
                      decoration: const InputDecoration(
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Icon(Icons.add),
                        ),
                        hintText: '添加今日的任务到收集箱',
                        border: InputBorder.none,
                      ),
                    )),
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    border: Border(
                        right: BorderSide(
                            width: 1,
                            color: Color.fromARGB(255, 243, 243, 243)))),
                width: 400,
                child: ListView(children: getTodoList(widget.tasks)),
              ),
            ),
          ],
        ),
        Expanded(
            child: Markdown(
          selectable: true,
          data: descController.text,
        ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 242, 245, 254),
              ),
              width: 180,
              child: ListView(
                children: [
                  Container(
                    color: currentCollection == 0
                        ? const Color.fromARGB(255, 224, 232, 253)
                        : null,
                    child: ListTile(
                      onTap: () {
                        setState(() {
                          currentCollection = 0;
                        });
                      },
                      leading: const Icon(Icons.today),
                      title: const Text('今天'),
                      trailing: Text(widget.today.length.toString()),
                    ),
                  ),
                  Container(
                    color: currentCollection == 1
                        ? const Color.fromARGB(255, 224, 232, 253)
                        : null,
                    child: ListTile(
                      onTap: () {
                        setState(() {
                          currentCollection = 1;
                        });
                      },
                      leading: const Icon(Icons.today),
                      title: const Text('明天'),
                      trailing: Text(widget.tomorrow.length.toString()),
                    ),
                  ),
                  Container(
                    color: currentCollection == 2
                        ? const Color.fromARGB(255, 224, 232, 253)
                        : null,
                    child: ListTile(
                      onTap: () {
                        setState(() {
                          currentCollection = 2;
                        });
                      },
                      leading: const Icon(Icons.collections),
                      title: const Text('收集箱'),
                      trailing: Text(widget.all.length.toString()),
                    ),
                  )
                ],
              )),
          Expanded(child: getContent(currentTask, currentCollection))
        ],
      ),
    );
  }
}
