import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:task_management/common/helpers/db_helper.dart';
import 'package:task_management/common/models/todo_model.dart';

part 'todo_provider.g.dart';

@riverpod
class TodoState extends _$TodoState {
  @override
  List<TodoModel> build() {
    return [];
  }

  Future<void> refresh() async {
    final todos = await DbHelper().getTodos();
    state = todos;
  }

  addTodo({
    required String title,
    required String desc,
    required String date,
    required String startTime,
    required String endTime,
  }) async {
    final todo = TodoModel(
      title: title,
      description: desc,
      isComplete: 0,
      date: date,
      startTime: startTime,
      endTime: endTime,
      remind: 0,
      repeat: 'yes',
    );
    await DbHelper().createTodo(todo);
    refresh();
  }

  updateTodo(TodoModel todo) async {
    await DbHelper().updateTodo(todo);
    refresh();
  }

  deleteTodo(int id) async {
    await DbHelper().deleteTodo(id);
    refresh();
  }

  Future<void> markAsComplete(TodoModel todo) async {
    await DbHelper().updateTodo(todo.copyWith(isComplete: 1));
    refresh();
  }

  String getToday() => DateTime.now().toString().substring(0, 10);

  String getTomorrow() => DateTime.now()
      .add(
        const Duration(days: 1),
      )
      .toString()
      .substring(0, 10);

  List<String> last30Days() {
    final oneMountAgo = DateTime.now().add(const Duration(days: 30));

    List<String> dates = [];
    for (var i = 0; i < 30; i++) {
      DateTime date = oneMountAgo.add(Duration(days: i));
      dates.add(date.toString().substring(0, 10));
    }
    return dates;
  }

  bool getStatus(TodoModel todo) {
    if (todo.isComplete == 0) {
      return false;
    }
    return true;
  }

  Future<void> updateStatus(TodoModel todo, bool status) async {
    if (status) {
      await DbHelper().updateTodo(todo.copyWith(isComplete: 1));
    } else {
      await DbHelper().updateTodo(todo.copyWith(isComplete: 0));
    }
    refresh();
  }
}
