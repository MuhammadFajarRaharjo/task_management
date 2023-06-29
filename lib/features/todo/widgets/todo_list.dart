import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management/common/constants/box_size.dart';
import 'package:task_management/common/models/todo_model.dart';

import '../controller/todo/todo_provider.dart';
import 'todo_tile.dart';

class TodoList extends ConsumerWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(todoStateProvider.notifier).refresh();
    final today = ref.read(todoStateProvider.notifier).getToday();
    final List<TodoModel> todosToday = ref
        .watch(todoStateProvider)
        .where(
          (todo) => todo.date.contains(today),
        )
        .toList();

    return ListView.builder(
      shrinkWrap: true,
      itemCount: todosToday.length,
      itemBuilder: (context, index) {
        bool isComplete =
            ref.watch(todoStateProvider.notifier).getStatus(todosToday[index]);
        return Padding(
          padding: EdgeInsets.only(bottom: BoxSize.padding20FW),
          child: TodoTile(
            title: todosToday[index].title,
            subtitle: todosToday[index].description,
            timeStart: todosToday[index].startTime,
            timeEnd: todosToday[index].endTime,
            onDelete: () => ref
                .read(todoStateProvider.notifier)
                .deleteTodo(todosToday[index].id!),
            switchValue: isComplete,
            onSwitchChanged: (value) {
              ref
                  .read(todoStateProvider.notifier)
                  .updateStatus(todosToday[index], value);
            },
          ),
        );
      },
    );
  }
}
