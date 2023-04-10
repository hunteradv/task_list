import 'package:flutter/material.dart';
import 'package:task_list/task_create.dart';
import 'package:task_list/task_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/task_list',
      routes: {
        '/task_create': (context) => const TaskCreatePage(),
        '/task_list': (context) => TaskListPage()
      },
    );
  }
}
