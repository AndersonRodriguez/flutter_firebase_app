import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
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
                  final user = await _auth.signInWithEmailAndPassword(
                    email: _email.text.trim(),
                    password: _password.text.trim(),
                  );

                  print(user);

                  _email.clear();
                  _password.clear();

                  Navigator.pushReplacementNamed(context, 'Service');
                } catch (e) {
                  print('===Error===');
                  print(e);
                }
              },
              child: const Text('Iniciar'),
            )
          ],
        ),
      ),
    );
  }
}
