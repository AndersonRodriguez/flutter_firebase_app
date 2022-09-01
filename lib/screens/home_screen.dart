import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'NewAccount');
              },
              child: const Text('Registro'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'Login');
              },
              child: const Text('Login'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'MyFirestore');
              },
              child: const Text('My Firestore'),
            ),
          ],
        ),
      ),
    );
  }
}
