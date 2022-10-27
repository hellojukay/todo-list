import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Calendar extends StatefulWidget {
  bool isMonth = true;

  @override
  State<StatefulWidget> createState() {
    return CalendarState();
  }
}

class CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 242, 245, 254),
          title: const Text("日期", style: TextStyle(color: Colors.black)),
          actions: [
            TextButton(
                onPressed: () {
                  setState(() {
                    widget.isMonth = false;
                  });
                },
                child: const Text("周", style: TextStyle(color: Colors.black))),
            TextButton(
                onPressed: () {
                  setState(() {
                    widget.isMonth = true;
                  });
                },
                child: const Text("月", style: TextStyle(color: Colors.black)))
          ],
        ),
        body: SfCalendar(
          view: widget.isMonth ? CalendarView.month : CalendarView.week,
          monthViewSettings: const MonthViewSettings(showAgenda: true),
        ));
  }
}
