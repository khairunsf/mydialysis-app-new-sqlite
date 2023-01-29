// ignore_for_file: curly_braces_in_flow_control_structures, prefer_const_constructors, use_build_context_synchronously, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:mydialysis_app/main.dart';
import 'package:mydialysis_app/model/slotModel.dart';
import 'package:mydialysis_app/model/userModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../db/databaseHelper.dart';

class DSTopBar extends StatefulWidget {
  const DSTopBar({super.key});

  @override
  State<DSTopBar> createState() => _DSTopBarState();
}

class _DSTopBarState extends State<DSTopBar> {
  DatabaseHelper? _databaseHelper;
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    _databaseHelper = DatabaseHelper();
    getUserName();
    super.initState();
  }

  String? currentUserName;

  Future<void> getUserName() async {
    final SharedPreferences sp = await prefs;
    setState(() {
      currentUserName = sp.getString("user_name");
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
            image: AssetImage('images/dialysis-staff-img.png'),
            height: 100,
            width: 100,
            alignment: Alignment(-1.0, -1.0),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              children: [
                Text('Hello $currentUserName'),
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
              final sp = await prefs;
              sp.setBool('isLoggedIn', false);
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: ((context) => MyApp())));
            },
          ),
        ],
      ),
    );
  }
}
