import 'package:flutter/material.dart';
import 'home.dart';

// int i = 0;

class AddTask extends StatefulWidget {
  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Task",
        ),
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
  // ignore: unused_field
  String _task;
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                  child: Text("Try to keep your task smaller and to the point",
                      style: TextStyle(fontSize: 20))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                // hintText: "What Do People Call You?",
                labelText: "task",
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.greenAccent,
                    ),
                    borderRadius: BorderRadius.circular(20)),
              ),
              enabled: true,
              onChanged: (value) => _task = value,
              controller: controller,
            ),
          ),
          FlatButton(
            onPressed: () {
              setState(() {
                tasks.add(_task.toString());
              });
              // Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyHomePage()));
              // i++;
            },
            child: Text(
              "Add",
              style: TextStyle(fontSize: 17.5),
            ),
            color: Colors.greenAccent,
          )
        ],
      ),
    );
  }
}
