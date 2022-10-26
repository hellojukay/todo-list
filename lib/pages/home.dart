import 'package:flutter/material.dart';

import '../widgets/done_list.dart';
import '../widgets/todo_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  Widget getContent() {
    return TodoList();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          color: const Color.fromARGB(255, 108, 142, 251),
          width: 50,
          child: Column(children: const [
            Icon(Icons.person),
            Icon(Icons.task),
            Icon(Icons.calendar_month),
            Icon(Icons.search)
          ]),
        ),
        Expanded(child: getContent())
      ],
    );
  }
}
