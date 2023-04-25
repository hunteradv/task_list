import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UserRegisterPage extends StatelessWidget {
  UserRegisterPage({super.key});

  FirebaseAuth auth = FirebaseAuth.instance;

  final TextEditingController txtEmail = TextEditingController();
  final TextEditingController txtPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Novo usuário"),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: txtEmail,
              decoration: const InputDecoration(
                labelText: "E-mail",
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: txtPassword,
              decoration: const InputDecoration(
                labelText: "Senha",
              ),
              keyboardType: TextInputType.text,
              obscureText: true,
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  auth.createUserWithEmailAndPassword(
                      email: txtEmail.text, password: txtPassword.text);
                },
                child: const Text("Registrar"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
