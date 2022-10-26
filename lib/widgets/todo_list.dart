import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todo_list/models/task.dart';

class TodoList extends StatefulWidget {
  TodoList({super.key});
  List<Task> tasks = Task.all();

  @override
  State<StatefulWidget> createState() {
    return TodoListState();
  }
}

class TodoListState extends State<TodoList> {
  int currentTask = 0;

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

  Widget getContent(int id) {
    TextEditingController controller = TextEditingController();
    controller.text = getDesc(currentTask);

    return Row(
      children: [
        Container(
          decoration: const BoxDecoration(
              border: Border(
                  right: BorderSide(
                      width: 1, color: Color.fromARGB(255, 243, 243, 243)))),
          width: 300,
          child: ListView(
              children: widget.tasks
                  .map((e) => ListTile(
                        onTap: () {
                          setState(() {
                            currentTask = e.id;
                          });
                        },
                        leading: Checkbox(
                          onChanged: (v) {
                            if (v!) {
                              setState(() {
                                widget.tasks = widget.tasks
                                    .where((element) => element.id != e.id)
                                    .toList();
                              });
                            }
                          },
                          value: false,
                        ),
                        title: Text(e.title),
                      ))
                  .toList()),
        ),
        Expanded(
            child: TextFormField(
          controller: controller,
          maxLines: 100,
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
              color: const Color.fromARGB(255, 242, 245, 254),
              width: 180,
              child: ListView(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const ListTile(
                        leading: Icon(Icons.today),
                        title: Text('今天'),
                        trailing: Text('1'),
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const ListTile(
                        leading: Icon(Icons.today),
                        title: Text('明天'),
                        trailing: Text('7'),
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const ListTile(
                        leading: Icon(Icons.collections),
                        title: Text('收集箱'),
                        trailing: Text('3'),
                      ))
                ],
              )),
          Expanded(child: getContent(1))
        ],
      ),
    );
  }
}
