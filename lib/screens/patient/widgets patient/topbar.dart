// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, curly_braces_in_flow_control_structures, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mydialysis_app/db/databaseHelper.dart';
import 'package:mydialysis_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TopBar extends StatefulWidget {
  TopBar({super.key});

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  DatabaseHelper? _databaseHelper;

  Future initDb() async {
    await _databaseHelper!.database;
    setState(() {});
  }

  @override
  void initState() {
    _databaseHelper = DatabaseHelper();
    initDb();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String? uemail;
    return Container(
      height: 120,
      color: Colors.blue[50],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //top bar
          Image(
            image: AssetImage('images/patient-img.png'),
            height: 100,
            width: 100,
            alignment: Alignment(-1.0, -1.0),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              children: [
                FutureBuilder(
                  future: _databaseHelper?.getUserbyEmail(uemail!),
                  builder: ((context, snapshot) {
                    if (snapshot.connectionState != ConnectionState.done)
                      return Text('Loading..');
                    var uname;
                    return Text('Hello, $uname',
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
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              prefs.setBool('isLoggedIn', false);
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: ((context) => MyApp())));
            },
          ),
        ],
      ),
    );
  }
}