// import 'package:another_todo_app/screens/addTask.dart';
import 'package:flutter/material.dart';
import 'dart:math';
// import 'package:path_provider/path_provider.dart';
// import 'dart:io';

Color rand() {
  return Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
}

Widget buildTodo1({String todo, String title, int index}) {
  bool linethrough = false;
  return Ink(
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
    child: Container(
      margin: EdgeInsets.fromLTRB(20, 20, 20, 5),
      height: 150,
      // width: width,
      decoration: BoxDecoration(
        color: rand(),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        onTap: () {
          linethrough = true;

          // i--;
        },
        title: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Text(
            "Task #${index + 1}",
            // textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 17.5,
              decoration: linethrough ? TextDecoration.lineThrough : null,
            ),
            // style: TextStyle(decoration: TextDecoration.lineThrough),
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Text(
            "data",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
    ),
  );
}

class BuildTodo extends StatefulWidget {
  BuildTodo({this.task, this.index, Key key}) : super(key: key);
  final num index;
  final String task;

  @override
  _BuildTodoState createState() => _BuildTodoState();
}

class _BuildTodoState extends State<BuildTodo> {
  bool linethrough = false;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
      child: Container(
        margin: EdgeInsets.fromLTRB(20, 20, 20, 5),
        height: 150,
        // width: width,
        decoration: BoxDecoration(
          color: rand(),
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListTile(
          onTap: () {
            setState(() {
              if (linethrough) {
                linethrough = false;
              } else if (!linethrough) {
                linethrough = true;
              }
            });
          },
          title: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: RichText(
              text: TextSpan(text: "Task #${widget.index + 1}", children: [
                TextSpan(
                  text: "${linethrough ? "  done" : ""}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    // fontSize: 15,
                  ),
                )
              ]),
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text(
              "${widget.task}",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                decoration: linethrough ? TextDecoration.lineThrough : null,
                fontSize: 25,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
