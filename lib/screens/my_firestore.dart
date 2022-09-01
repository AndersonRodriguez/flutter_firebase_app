import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyFirestoreScreen extends StatefulWidget {
  const MyFirestoreScreen({Key? key}) : super(key: key);

  @override
  State<MyFirestoreScreen> createState() => _MyFirestoreScreenState();
}

class _MyFirestoreScreenState extends State<MyFirestoreScreen> {
  List<Widget> dataListWidget(AsyncSnapshot snapshot) {
    if (snapshot.data != null) {
      return snapshot.data.docs
          .map<Widget>(
            (document) => ListTile(
              title: Text(document['Name']),
              subtitle: Text(document['City']),
            ),
          )
          .toList();
    } else {
      return [Container()];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My firestore'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('customers').snapshots(),
        builder: (context, snapshot) => ListView(
          children: dataListWidget(snapshot),
        ),
      ),
    );
  }
}
