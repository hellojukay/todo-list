import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MarkdownEditor extends StatefulWidget {
  const MarkdownEditor({super.key, required this.controller});

  final TextEditingController controller;
  @override
  State<StatefulWidget> createState() {
    return MarkdownEditorState();
  }
}

class MarkdownEditorState extends State<MarkdownEditor> {
  bool editing = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        setState(() {
          editing = !editing;
        });
      },
      child: editing
          ? Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                style: const TextStyle(fontSize: 23),
                decoration: const InputDecoration(fillColor: Colors.white),
                maxLines: 1000,
                controller: widget.controller,
                focusNode: FocusNode(),
                autofocus: true,
              ),
            )
          : Markdown(
              onTapLink: (text, href, title) {
                if (href != null) {
                  launchUrlString(href);
                }
              },
              selectable: true,
              data: widget.controller.text,
            ),
    );
  }
}
