import 'package:flutter/material.dart';
import 'task.dart';

class TaskListPage extends StatelessWidget {
  List<Task> tasks = [
    Task('1', 'Task 1'),
    Task('2', 'Task 2', priority: 'low'),
    Task('3', 'Task 3', finished: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tasks"),
      ),
      body: ListView(
          children: tasks
              .map((task) => CheckboxListTile(
                    onChanged: (value) {},
                    value: task.finished,
                    title: Text(task.name!),
                    subtitle: Text(task.priority!),
                  ))
              .toList()),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed('/task_create'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
