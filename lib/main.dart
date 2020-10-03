// import 'package:another_todo_app/screens/home.dart';
// import 'package:another_todo_app/screens/addTask.dart';
import 'package:todo_app/screens/home.dart';
import 'package:flutter/material.dart';
// import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        // visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
