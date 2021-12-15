import 'package:mobx/mobx.dart';
import 'package:mobx_todo/stores/todo.dart';

part 'todo_list.g.dart';

enum VisibilityFilter { all, pending, completed }

class TodoList = _TodoList with _$TodoList;

abstract class _TodoList with Store {
  @observable
  ObservableList<Todo> todos = ObservableList<Todo>();

  @observable
  VisibilityFilter filter = VisibilityFilter.all;

  @computed
  ObservableList<Todo> get pendingTodos =>
      ObservableList.of(todos.where((element) => element.done == false));

  @computed
  ObservableList<Todo> get completedTodos =>
      ObservableList.of(todos.where((element) => element.done == true));

  @computed
  bool get hasPendingTodos => pendingTodos.isNotEmpty;

  @computed
  bool get hasCompletedTodos => completedTodos.isNotEmpty;

  @computed
  String get itemDescription {
    if (todos.isEmpty) {
      return 'Add todo';
    }
    return '${pendingTodos.length} is waiting, ${completedTodos.length} already done';
  }

  @computed
  ObservableList<Todo> get visibleTodos {
    switch (filter) {
      case VisibilityFilter.completed:
        return completedTodos;
      case VisibilityFilter.pending:
        return pendingTodos;
      default:
        return todos;
    }
  }

  @computed
  bool get canRemovedAllCompleted =>
      hasCompletedTodos && filter != VisibilityFilter.pending;

  @computed
  bool get canMarkAllAsCompleted =>
      hasPendingTodos && filter != VisibilityFilter.completed;

  @action
  void addTodo(String description) {
    final todo = Todo(description);
    todos.add(todo);
  }

  @action
  void removeTodo(Todo todo) {
    todos.remove(todo);
  }
  
  @action
  void changeFilter(VisibilityFilter filter) => this.filter = filter;
  
  @action
  void removeCompleted() {
    todos.removeWhere((element) => element.done);
  }
  
  @action
  void markAllAsCompleted() {
    for (final todo in todos) {
      todo.done = true;
    }
  }
}
