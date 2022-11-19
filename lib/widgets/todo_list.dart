import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/http/task.dart';
import '../widgets/markdown.dart';
import '../models/task.dart';

// ignore: must_be_immutable
class TodoList extends StatefulWidget {
  TodoList({super.key});

  List<Task> tasks = [];

  @override
  State<StatefulWidget> createState() {
    return TodoListState();
  }
}

class TodoListState extends State<TodoList> {
  Task? currentTask;
  int currentCollection = 0;

  remove(int id, int day) async {
    await removeTask(id);
  }

  finishTask(Task task) async {
    task.finished = true;
    return updateTask(task);
  }

  List<Widget> getTodoList(List<Task> tasks) {
    return tasks.map((e) {
      TextEditingController controller = TextEditingController();
      controller.value = TextEditingValue(
          text: e.title,
          selection: TextSelection.fromPosition(TextPosition(
              affinity: TextAffinity.downstream, offset: e.title.length)));

      return ListTile(
        trailing: IconButton(
            onPressed: () {
              showDatePicker(
                context: context,
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(const Duration(days: 100)),
                initialDate: DateTime.now(),
              );
            },
            icon: const Icon(Icons.calendar_month)),
        leading: Checkbox(
          onChanged: (v) {
            if (v!) {
              setState(() {
                finishTask(e).then((v) {
                  loadTask().then((tasks) {
                    setState(() {
                      widget.tasks = tasks;
                    });
                  });
                });
              });
            }
          },
          value: false,
        ),
        title: InkWell(
          onFocusChange: (focus) {
            if (focus) {
              setState(() {
                currentTask = e;
              });
              return;
            }
            if (controller.text == e.title) return;
            e.title = controller.text;
            updateTask(e);
          },
          child: TextField(
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
            controller: controller,
          ),
        ),
      );
    }).toList();
  }

  Widget getContent(int day) {
    // TextEditingController descController = TextEditingController();

    // descController.text = currentTask!.desc;
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
                      onSubmitted: (value) {
                        addTask(value).then((task) {
                          setState(() {
                            widget.tasks.insert(0, task);
                          });
                        });
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
            child: currentTask != null
                ? MarkdownEditor(
                    task: currentTask!,
                  )
                : Container())
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print("render ...");
    }
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
                      trailing: Text(widget.tasks.length.toString()),
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
                      trailing: Text(widget.tasks.length.toString()),
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
                      trailing: Text(widget.tasks.length.toString()),
                    ),
                  )
                ],
              )),
          Expanded(child: getContent(currentCollection))
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    loadTask().then((tasks) {
      setState(() {
        if (kDebugMode) {
          print("加载了 ${tasks.length} 个任务");
        }
        widget.tasks = tasks;
      });
    });
  }
}
