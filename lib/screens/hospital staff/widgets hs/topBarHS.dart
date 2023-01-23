// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, curly_braces_in_flow_control_structures

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HSTopBar extends StatefulWidget {
  HSTopBar({super.key});

  @override
  State<HSTopBar> createState() => _HSTopBarState();
}

class _HSTopBarState extends State<HSTopBar> {
  final user = FirebaseAuth.instance.currentUser;
  String? uName;

  Future _fetch() async {
    final firebaseUser = await FirebaseAuth.instance.currentUser!.uid;
    if (firebaseUser != null)
      await FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUser)
          .get()
          .then((value) {
        uName = value.data()!['name'];
        print(uName);
      }).catchError((e) {
        print(e);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      color: Colors.blue[50],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //top bar
          Image(
            image: AssetImage('images/hosp-staff-img.png'),
            height: 100,
            width: 100,
            alignment: Alignment(-1.0, -1.0),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              children: [
                FutureBuilder(
                  future: _fetch(),
                  builder: ((context, snapshot) {
                    if (snapshot.connectionState != ConnectionState.done)
                      return Text('Loading..');
                    return Text('Hello, $uName',
                        style: TextStyle(
                          fontSize: 20,
                        ));
                  }),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),

          //Logout
          IconButton(
            icon: Icon(
              Icons.logout,
            ),
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
    );
  }
}