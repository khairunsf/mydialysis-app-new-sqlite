// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TestingFetch extends StatefulWidget {
  const TestingFetch({super.key});

  @override
  State<TestingFetch> createState() => _TestingFetchState();
}

class _TestingFetchState extends State<TestingFetch> {
  String? pName;
  String? pNumber;
  String? pEmail;
  String? pDOB;
  String? pAddress;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test'),
      ),
      body: Center(
        child: FutureBuilder(
          future: _fetch(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done)
              return Text('Loading..');
            return Text('Hello, $pName');
          }),
        ),
      ),
    );
  }

  Future _fetch() async {
    final firebaseUser = await FirebaseAuth.instance.currentUser!.uid;
    if (firebaseUser != null)
      await FirebaseFirestore.instance
          .collection('patients')
          .doc(firebaseUser)
          .get()
          .then((value) {
        pName = value.data()!['name'];
        pNumber = value.data()!['phonenumber'];
        pEmail = value.data()!['email'];
        pDOB = value.data()!['dob'];
        pAddress = value.data()!['address'];
        
      }).catchError((e) {
        print(e);
      });
  }
}
