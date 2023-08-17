import 'package:flutter/material.dart';
import 'package:test_todo_app/widgets/task_tile.dart';

import '../models/tasks.dart';

class TaskList extends StatefulWidget {
  final List<Task> tasks;
  const TaskList({
    super.key, required this.tasks,
  });

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      itemCount: widget.tasks.length,
      itemBuilder: (context, index) {
        return TaskTile(
          title: widget.tasks[index].title,
          isDone: widget.tasks[index].isDone,
          isDoneCallback: (value){
            setState(() {
              widget.tasks[index].toggleDone();
            });
          },
        );
      },
    );
  }
}
