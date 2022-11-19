import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:todo_list/http/task.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../models/task.dart';

class MarkdownEditor extends StatefulWidget {
  const MarkdownEditor({super.key, required this.task});

  final Task task;
  @override
  State<StatefulWidget> createState() {
    return MarkdownEditorState();
  }
}

class MarkdownEditorState extends State<MarkdownEditor> {
  bool editing = false;
  @override
  Widget build(BuildContext context) {
    final TextEditingController controller =
        TextEditingController(text: widget.task.desc);
    return InkWell(
      onHover: (hover) {
        if (!hover) {
          if (widget.task.desc == controller.text) return;
          widget.task.desc = controller.text;
          updateTask(widget.task);
          setState(() {
            editing = false;
          });
          return;
        }
      },
      onTap: () {
        setState(() {
          editing = true;
        });
      },
      child: editing
          ? Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                style: const TextStyle(fontSize: 23),
                decoration: const InputDecoration(fillColor: Colors.white),
                maxLines: 1000,
                controller: controller,
              ),
            )
          : Markdown(
              onTapLink: (text, href, title) {
                if (href != null) {
                  launchUrlString(href);
                }
              },
              selectable: true,
              data: controller.text,
            ),
    );
  }
}
