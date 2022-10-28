import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Calendar extends StatefulWidget {
  final CalendarController controller = CalendarController();

  Calendar({super.key});

  @override
  State<StatefulWidget> createState() {
    return CalendarState();
  }
}

class CalendarState extends State<Calendar> {
  @override
  void initState() {
    super.initState();
    widget.controller.view = CalendarView.month;
  }

  Widget getCalendar() {
    return Column(
      children: [
        Container(
          height: 40,
          color: Colors.blue,
          child: Row(children: [
            Expanded(child: Container()),
            TextButton(
                onPressed: () {
                  setState(() {
                    widget.controller.view = CalendarView.month;
                  });
                },
                child: const Text("周", style: TextStyle(color: Colors.black))),
            TextButton(
                onPressed: () {
                  setState(() {
                    widget.controller.view = CalendarView.week;
                  });
                },
                child: const Text("月", style: TextStyle(color: Colors.black)))
          ]),
        ),
        Expanded(
            child: SfCalendar(
          controller: widget.controller,
          monthViewSettings: const MonthViewSettings(showAgenda: true),
        ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return getCalendar();
  }
}
