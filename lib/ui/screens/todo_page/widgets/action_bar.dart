import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_todo/stores/todo_list.dart';
import 'package:provider/provider.dart';

class ActionBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<TodoList>(context);

    return Column(
      children: [
        Observer(
          builder: (_) => Column(
            children: [
              RadioListTile(
                title: Text('All'),
                value: VisibilityFilter.all,
                groupValue: store.filter,
                onChanged: (filter) =>
                    store.filter = filter as VisibilityFilter,
              ),
              RadioListTile(
                title: Text('Pending'),
                value: VisibilityFilter.pending,
                groupValue: store.filter,
                onChanged: (filter) =>
                    store.filter = filter as VisibilityFilter,
              ),
              RadioListTile(
                title: Text('Completed'),
                value: VisibilityFilter.completed,
                groupValue: store.filter,
                onChanged: (filter) =>
                    store.filter = filter as VisibilityFilter,
              ),
            ],
          ),
        ),
        Observer(
          builder: (_) => ButtonBar(
            children: [
              ElevatedButton(
                  child: Text('Delete completed'),
                  onPressed: store.canRemovedAllCompleted
                      ? store.removeCompleted
                      : null),
              ElevatedButton(
                  child: Text('Mark all as completed'),
                  onPressed: store.canMarkAllAsCompleted
                      ? store.markAllAsCompleted
                      : null),
            ],
          ),
        ),
      ],
    );
  }
}
