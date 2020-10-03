import 'dart:math';
import 'package:flutter/material.dart';
import 'package:todo_app/models.dart/todomodel.dart';
import 'package:todo_app/screens/home.dart';

class AddTask extends StatefulWidget {
  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: Text(
            "Add Task",
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor),
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController task = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                "Add Your Task",
                style: TextStyle(
                    color: Theme.of(context).primaryColor, fontSize: 25),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  controller: task,
                  maxLines: 10,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
                ),
              ),
            ),
          ),
          FlatButton.icon(
              color: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              onPressed: () {
                todos.add(Todo(
                    title: task.text,
                    isdone: false,
                    bgColor: Color((Random().nextDouble() * 0xFFFFFF).toInt())
                        .withOpacity(1.0)));
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => HomePage()));
                print(todos.elementAt(todos.length - 1).title);
              },
              icon: Icon(Icons.add),
              label: Text("Add"))
        ],
      ),
    );
  }
}
