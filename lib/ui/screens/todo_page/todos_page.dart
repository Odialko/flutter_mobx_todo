import 'package:flutter/material.dart';
import 'package:mobx_todo/stores/todo_list.dart';
import 'package:mobx_todo/ui/screens/todo_page/widgets/action_bar.dart';
import 'package:mobx_todo/ui/screens/todo_page/widgets/add_todo.dart';
import 'package:mobx_todo/ui/screens/todo_page/widgets/description.dart';
import 'package:mobx_todo/ui/screens/todo_page/widgets/todo_list_view.dart';
import 'package:provider/provider.dart';

class TodosPage extends StatelessWidget {
  final TodoList todoList = TodoList();

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => TodoList(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Todo list example'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            AddTodo(),
            ActionBar(),
            Description(),
            TodoListView(),
          ],
        ),
      ),
    );
  }
}
