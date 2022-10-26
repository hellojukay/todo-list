import 'package:flutter/material.dart';

class DoneList extends StatefulWidget {
  const DoneList({super.key});

  @override
  State<StatefulWidget> createState() {
    return DoneListState();
  }
}

class DoneListState extends State<DoneList> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('done'));
  }
}
