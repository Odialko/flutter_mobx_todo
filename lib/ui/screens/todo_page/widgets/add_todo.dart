import 'package:flutter/material.dart';
import 'package:mobx_todo/stores/todo_list.dart';
import 'package:provider/provider.dart';


class AddTodo extends StatelessWidget {
  final _textController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<TodoList>(context);
    return TextField(
      autofocus: true,
      controller: _textController,
      decoration: InputDecoration(label: Text('Add todo'), contentPadding: EdgeInsets.all(8.0),),
      textInputAction: TextInputAction.done,
      onSubmitted: (String value) {
        store.addTodo(value);
        _textController.clear();
      },
    );
  }
}
