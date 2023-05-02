// ignore: must_be_immutable
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UserRegisterPage extends StatelessWidget {
  UserRegisterPage({super.key});

  FirebaseAuth auth = FirebaseAuth.instance;

  final TextEditingController txtEmail = TextEditingController();
  final TextEditingController txtPassword = TextEditingController();

  final snackBarErrorMessage = const SnackBar(content: Text("Teste"));

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
                onPressed: () async {
                  try {
                    await auth.createUserWithEmailAndPassword(
                        email: txtEmail.text, password: txtPassword.text);

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
                child: const Text("Registrar"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
