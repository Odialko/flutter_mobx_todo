import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_todo/stores/todo_list.dart';
import 'package:provider/provider.dart';

class TodoListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<TodoList>(context);

    return Observer(
      builder: (_) => Flexible(
        child: ListView.builder(
          itemCount: store.visibleTodos.length,
          itemBuilder: (_, index) {
            final todo = store.visibleTodos[index];
            return Observer(
              builder: (_) => CheckboxListTile(
                  title: Row(
                    children: [
                      Expanded(
                        child: Text(
                          todo.description,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      IconButton(
                        onPressed: () => store.removeTodo(todo),
                        icon: Icon(Icons.delete),
                      ),
                    ],
                  ),
                  value: todo.done,
                  onChanged: (flag) => todo.done = flag!),
            );
          },
        ),
      ),
    );
  }
}
