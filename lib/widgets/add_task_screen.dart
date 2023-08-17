import 'package:flutter/material.dart';



class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key, this.addTaskCallback});

  final Function(String?)? addTaskCallback;

  @override
  Widget build(BuildContext context) {
    String task = '';
    return SingleChildScrollView(
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Add Task',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                autofocus: true,
                decoration: const InputDecoration(),
                onChanged: (value) {
                  task = value;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlueAccent,
                ),
                onPressed: () {
                  addTaskCallback!(task);

                },
                child: const Text('Add'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
