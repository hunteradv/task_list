import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:task_list/task_create.dart';
import 'package:task_list/task_list.dart';
import 'package:task_list/user_register.dart';

const firebaseConfig = FirebaseOptions(
    apiKey: "AIzaSyCZyOrEA4Zh44QVjAfqtxARqtRvbfysQ8c",
    authDomain: "task-list-dd2e5.firebaseapp.com",
    projectId: "task-list-dd2e5",
    storageBucket: "task-list-dd2e5.appspot.com",
    messagingSenderId: "756975048599",
    appId: "1:756975048599:web:5b12784750fd8737f8d6d2");

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: firebaseConfig);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/user_register',
      routes: {
        '/task_create': (context) => TaskCreatePage(),
        '/task_list': (context) => TaskListPage(),
        '/user_register': (context) => UserRegisterPage()
      },
    );
  }
}
