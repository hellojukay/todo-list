import 'dart:developer';

import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<StatefulWidget> createState() {
    return TodoListState();
  }
}

class TodoListState extends State<TodoList> {
  Widget getContent(int id) {
    return Row(
      children: [
        Container(
          decoration: const BoxDecoration(
              border: Border(
                  right: BorderSide(
                      width: 1, color: Color.fromARGB(255, 243, 243, 243)))),
          width: 300,
          child: ListView(
            children: [
              ListTile(
                leading: Checkbox(
                  onChanged: (bool? value) {},
                  value: false,
                ),
                title: Text("11111111111"),
              ),
              ListTile(
                leading: Checkbox(
                  onChanged: (bool? value) {},
                  value: false,
                ),
                title: Text("11111111111"),
              ),
              ListTile(
                leading: Checkbox(
                  onChanged: (bool? value) {},
                  value: false,
                ),
                title: Text("11111111111"),
              ),
              ListTile(
                leading: Checkbox(
                  onChanged: (bool? value) {},
                  value: false,
                ),
                title: Text("11111111111"),
              ),
              ListTile(
                leading: Checkbox(
                  onChanged: (bool? value) {},
                  value: false,
                ),
                title: Text("11111111111"),
              ),
              ListTile(
                leading: Checkbox(
                  onChanged: (bool? value) {},
                  value: false,
                ),
                title: Text("11111111111"),
              )
            ],
          ),
        ),
        Expanded(
            child: TextFormField(
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
