import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_todo/stores/todo_list.dart';
import 'package:provider/provider.dart';

class Description extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<TodoList>(context);

    return Observer(
      builder: (_) => Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          store.itemDescription,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
