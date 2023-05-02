import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TaskCreatePage extends StatelessWidget {
  TaskCreatePage({super.key});
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController txtName = TextEditingController();

  void add(BuildContext context, String name, bool finished) {
    firestore.collection('tasks').add(
        {'name': name, 'finished': finished, 'uid': auth.currentUser!.uid});
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
            TextField(
              controller: txtName,
              decoration: const InputDecoration(
                  hintText: "Digite o que precisa fazer..."),
              keyboardType: TextInputType.text,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  add(context, txtName.text, false);
                  Navigator.of(context).pop();
                },
                child: const Text("Adicionar"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
