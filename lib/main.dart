import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/screens/home_screen.dart';
import 'package:flutter_firebase_app/screens/login_screen.dart';
import 'package:flutter_firebase_app/screens/my_firestore.dart';
import 'package:flutter_firebase_app/screens/new_account_screen.dart';
import 'package:flutter_firebase_app/screens/service_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'Home': (context) => const HomeScreen(),
        'NewAccount': (context) => const NewAccountScreen(),
        'Login': (context) => const LoginScreen(),
        'Service': (context) => const ServiceScreen(),
        'MyFirestore': (context) => const MyFirestoreScreen(),
      },
      home: const HomeScreen(),
    );
  }
}
