import 'dart:ui';

class Todo {
  String title;
  bool isdone;
  Color bgColor;
  Todo({this.bgColor, this.isdone, this.title});
}

List<Todo> todos = [];
