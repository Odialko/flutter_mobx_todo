import 'package:flutter/material.dart';
import 'package:mobx_todo/ui/screens/todo_page/todos_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter/MobX ToDo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: TodosPage(),
    );
  }
}
