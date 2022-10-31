import 'package:flutter/material.dart';
import '../widgets/todo_list.dart';
import 'calendar.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  int contentID = 0;

  @override
  void initState() {
    super.initState();
  }

  about(BuildContext context) {
    showAboutDialog(
        context: context,
        applicationName: "TodoList小程序",
        applicationVersion: "v0.1.0");
  }

  Widget getContent(int id) {
    if (id == 0) {
      return TodoList();
    }
    if (id == 1) {
      return Calendar();
    }
    return const Text("coming soon");
  }

  void search(String text) {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            color: const Color.fromARGB(255, 108, 142, 251),
            width: 50,
            child: Column(children: [
              const SizedBox(height: 5),
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
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return SimpleDialog(
                          contentPadding: const EdgeInsets.all(0),
                          children: [
                            DecoratedBox(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(90)),
                                child: SizedBox(
                                    width: 450,
                                    child: TextField(
                                      maxLines: 1,
                                      textInputAction: TextInputAction.search,
                                      onSubmitted: (v) {
                                        search(v);
                                      },
                                      enableInteractiveSelection: true,
                                      decoration: const InputDecoration(
                                        prefixIcon: Icon(Icons.search),
                                        hintText: "search",
                                        border: InputBorder.none,
                                      ),
                                    )))
                          ],
                        );
                      });
                },
              ),
              Expanded(child: Container()),
              IconButton(
                onPressed: () {
                  about(context);
                },
                icon: const Icon(Icons.settings),
              ),
              IconButton(
                onPressed: () {
                  about(context);
                },
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
