// ignore_for_file: curly_braces_in_flow_control_structures, prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:mydialysis_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../db/databaseHelper.dart';

class DSTopBar extends StatefulWidget {
  const DSTopBar({super.key});

  @override
  State<DSTopBar> createState() => _DSTopBarState();
}

class _DSTopBarState extends State<DSTopBar> {
  String? uName;
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
    var uemail;
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
                FutureBuilder(
                  future: _databaseHelper?.getUserbyEmail(uemail!),
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
            onPressed: () async{
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