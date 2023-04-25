import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  FirebaseAuth auth = FirebaseAuth.instance;

  final TextEditingController txtEmail = TextEditingController();
  final TextEditingController txtPassword = TextEditingController();

  Future<User?> login(String email, String password) async {
    try {
      UserCredential result = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('Usuário não encontrado para este e-mail.');
      } else if (e.code == 'wrong-password') {
        print('Senha incorreta fornecida para este usuário.');
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
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
                onPressed: () async {
                  try {
                    await auth.signInWithEmailAndPassword(
                        email: txtEmail.text, password: txtPassword.text);
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).pushNamed('/task_list');
                  } on Exception catch (e) {
                    print(e);
                  }
                },
                child: const Text("Login"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
