import 'package:todo_app/screens/addTask.dart';
import 'package:todo_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/constants.dart';

List tasks = <String>[
  "hello 👋",
  "This task is done",
  "You can also slide the task left or right to dismis it 😉"
];

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryColor,
        title: Text(
          "Todo",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              setState(() {
                // tasks.add("hello");
              });
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AddTask()));
            },
            tooltip: "add item",
            color: Colors.black,
          ),
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: () => {
              setState(() {
                tasks = [];
              })
            },
            color: Colors.black,
            tooltip: "delete all items",
          )
        ],
      ),
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          key: Key(tasks[index].toString()),
          child: BuildTodo(
            index: index,
            task: "${tasks[index]}",
          ),
          onDismissed: (direction) {
            // i--;
            setState(() {
              tasks.removeAt(index);
            });
          },
        );
      },
    );
  }
}
