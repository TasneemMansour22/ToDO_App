import 'package:flutter/material.dart';

import '../models/tasks.dart';
import '../widgets/add_task_screen.dart';
import '../widgets/task_list.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List<Task> tasks = [
    Task(title: 'Buy milk'),
    Task(title: 'Buy eggs'),
    Task(title: 'Buy bread'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => AddTaskScreen(
              addTaskCallback: (task) {
                setState(() {
                  tasks.add(Task(title: task ?? ''));
                });
                Navigator.pop(context);
              },
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                topLeft: Radius.circular(15),
              ),
            ),
          );
        },
        backgroundColor: Colors.lightBlueAccent,
        child: const Icon(
          Icons.add,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 64),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 12,
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 50,
                  child: Icon(
                    Icons.list,
                    color: Colors.lightBlueAccent,
                    size: 54,
                  ),
                ),
                Text(
                  'Todoey',
                  style: TextStyle(
                      fontSize: 54,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  '12 Tasks',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  topLeft: Radius.circular(15),
                ),
              ),
              child: TaskList(
                tasks: tasks,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
