import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewAccountScreen extends StatefulWidget {
  const NewAccountScreen({Key? key}) : super(key: key);

  @override
  State<NewAccountScreen> createState() => _NewAccountScreenState();
}

class _NewAccountScreenState extends State<NewAccountScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.email),
                const SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: 200,
                  child: TextField(
                    controller: _email,
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.password),
                const SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: 200,
                  child: TextField(
                    controller: _password,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    autocorrect: false,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                print('${_email.text} ${_password.text}');

                try {
                  final newUser = await _auth.createUserWithEmailAndPassword(
                    email: _email.text.trim(),
                    password: _password.text.trim(),
                  );

                  print(newUser);

                  _email.clear();
                  _password.clear();

                  Navigator.pop(context);
                } catch (e) {
                  print('===Error===');
                  print(e);
                }
              },
              child: const Text('Crear'),
            )
          ],
        ),
      ),
    );
  }
}
