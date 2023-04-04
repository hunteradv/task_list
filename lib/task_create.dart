import 'package:flutter/material.dart';

class TaskCreatePage extends StatelessWidget {
  const TaskCreatePage({super.key});

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
            Container(
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
