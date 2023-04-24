import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TaskListPage extends StatelessWidget {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void update(String id, bool finished) {
    firestore.collection('tasks').doc(id).update({'finished': finished});
  }

  void delete(String id) {
    firestore.collection('tasks').doc(id).delete();
  }

  TaskListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tasks"),
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: firestore
              .collection('tasks')
              .where('finished', isEqualTo: false)
              .orderBy('name')
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            var tasks = snapshot.data!.docs;

            return ListView(
                children: tasks
                    .map((task) => Dismissible(
                          key: Key(task.id),
                          background: Container(color: Colors.red),
                          onDismissed: (_) => delete(task.id),
                          child: CheckboxListTile(
                              onChanged: (value) => update(task.id, value!),
                              value: task['finished'],
                              title: Text(task['name'])),
                        ))
                    .toList());
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed('/task_create'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
