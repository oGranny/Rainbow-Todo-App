import 'package:flutter/material.dart';
import 'package:todo_app/models.dart/todomodel.dart';
import 'package:todo_app/screens/addTask.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(),
                    Text(
                      "Todo List",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (BuildContext context) => AddTask())),
                        color: Colors.white)
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 4,
                child: Container(
                  child: ListView.builder(
                      itemCount: todos.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                            key: Key(todos[index].toString()),
                            onDismissed: (direction) {
                              setState(() {
                                todos.removeAt(index);
                              });
                            },
                            child: Container(
                              height: 100,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                  color: todos.elementAt(index).bgColor,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                children: [
                                  Checkbox(
                                      value: todos.elementAt(index).isdone,
                                      activeColor: Colors.green,
                                      onChanged: (bool newValue) {
                                        setState(() {
                                          todos.elementAt(index).isdone =
                                              newValue;
                                        });
                                      }),
                                  Text(
                                    todos.elementAt(index).title,
                                    style: TextStyle(
                                        fontSize: 25,
                                        decoration:
                                            todos.elementAt(index).isdone
                                                ? TextDecoration.lineThrough
                                                : null),
                                  )
                                ],
                              ),
                            ));
                      }),
                ))
          ],
        ),
      ),
    );
  }
}
