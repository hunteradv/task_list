import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TaskListPage extends StatelessWidget {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  TaskListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tasks"),
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: firestore.collection('tasks').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            var tasks = snapshot.data!.docs;

            return ListView(
                children: tasks
                    .map((task) => CheckboxListTile(
                        onChanged: (value) {},
                        value: task['finished'],
                        title: Text(task['name'])))
                    .toList());
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed('/task_create'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
