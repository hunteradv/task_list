import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class TaskCreatePage extends StatelessWidget {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void add(BuildContext context, String name, bool finished) {
    firestore.collection('tasks').add({'name': name, 'finished': finished});
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New task"),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            const TextField(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("Adicionar"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
