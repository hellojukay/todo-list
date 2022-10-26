import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../widgets/todo_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  Widget getContent(int id) {
    if (id == 0) {
      return TodoList();
    }
    if (id == 1) {
      return Scaffold(
          body: SfCalendar(
        view: CalendarView.month,
        monthViewSettings: MonthViewSettings(showAgenda: true),
      ));
    }
    return const Text("coming soon");
  }

  int contentID = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            color: const Color.fromARGB(255, 108, 142, 251),
            width: 50,
            child: Column(children: [
              const Icon(Icons.person),
              IconButton(
                onPressed: () {
                  setState(() {
                    contentID = 0;
                  });
                },
                icon: const Icon(Icons.task),
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      contentID = 1;
                    });
                  },
                  icon: const Icon(Icons.calendar_month)),
              const Icon(Icons.search),
              Expanded(child: Container()),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.help),
              ),
            ]),
          ),
          Expanded(child: getContent(contentID))
        ],
      ),
    );
  }
}
