import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({Key? key}) : super(key: key);

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final _database = FirebaseDatabase.instance.ref().child('My_Service');

  String _userId = '';

  @override
  void initState() {
    super.initState();
    getCurrentUser().then((user) {
      if (user != null) {
        setState(() {
          _userId = user.uid;
        });
      }
    });
  }

  Future<User?> getCurrentUser() async {
    if (_auth.currentUser != null) {
      return _auth.currentUser;
    }

    return null;
  }

  sendData() {
    _database.child('users').push().set({
      'Name': 'Juan',
      'Country': 'Mexico',
      'City': 'Mexico',
      'UserId': _userId
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Service'),
        actions: [
          IconButton(
            onPressed: () {
              _auth.signOut();
              Navigator.pop(context);
            },
            icon: const Icon(Icons.exit_to_app),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(_userId),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                sendData();
              },
              child: const Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}
