import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TaskListPage extends StatelessWidget {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

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
        actions: [
          IconButton(
              onPressed: () async {
                try {
                  await auth.signOut();

                  // ignore: use_build_context_synchronously
                  Navigator.of(context).pushNamed('/user_login');
                } on Exception catch (e) {
                  String message = e.toString();

                  final snackBar = SnackBar(
                    content: Text(message),
                  );

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: firestore
              .collection('tasks')
              .where('uid', isEqualTo: auth.currentUser!.uid)
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
