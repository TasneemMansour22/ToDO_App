import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.title,
    required this.isDone,
    this.isDoneCallback,
  });

  final String title;
  final bool isDone;
  final Function(bool?)? isDoneCallback;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          decoration: isDone ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        value: isDone,
        onChanged: isDoneCallback,
      ),
    );
  }
}

//كل ما تتغير الحالة ببنيلي ستات جديدة منه
