import 'package:flutter/material.dart';
import 'package:task_list/task_create.dart';

class TaskListPage extends StatelessWidget {
  const TaskListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tasks"),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed('/task_create'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
