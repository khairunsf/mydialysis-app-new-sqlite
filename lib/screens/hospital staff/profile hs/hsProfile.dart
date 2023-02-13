// ignore_for_file: curly_braces_in_flow_control_structures, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mydialysis_app/screens/hospital%20staff/profile%20hs/hsEditProfile.dart';
import 'package:mydialysis_app/screens/hospital%20staff/widgets%20hs/secondpartHS.dart';
import 'package:mydialysis_app/screens/hospital%20staff/widgets%20hs/topBarHS.dart';
import 'package:mydialysis_app/screens/patient/widgets%20patient/topbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../db/databaseHelper.dart';

class HSProfilePage extends StatefulWidget {
  const HSProfilePage({super.key});

  @override
  State<HSProfilePage> createState() => _HSProfilePageState();
}

class _HSProfilePageState extends State<HSProfilePage> {
  DatabaseHelper? _databaseHelper;
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    _databaseHelper = DatabaseHelper();
    getUserName();
    super.initState();
  }

  String? currentUserName, phoneNumber, email, dob, address;
  late int uid;

  Future<void> getUserName() async {
    final SharedPreferences sp = await prefs;
    setState(() {
      currentUserName = sp.getString("user_name");
      phoneNumber = sp.getString("phone_num");
      email = sp.getString("email");
      dob = sp.getString("user_dob");
      address = sp.getString("user_address");
      uid = sp.getInt("user_id")!;
    });
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            HSTopBar(),
            SecondPartHSprofile(),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 235, 243, 249),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      //Name part
                      Row(
                        children: [
                          Text(
                            'Name: ',
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(
                            width: 80,
                          ),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            child: Text('$currentUserName', style: TextStyle(fontSize: 18)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      //Phone number
                      Row(
                        children: [
                          Text(
                            'Phone Number: ',
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            child: Text('$phoneNumber', style: TextStyle(fontSize: 18)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      //email
                      Row(
                        children: [
                          Text(
                            'Email: ',
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(
                            width: 82,
                          ),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            child: Text('$email', style: TextStyle(fontSize: 18)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      //dob
                      Row(
                        children: [
                          Text(
                            'Date of Birth: ',
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(
                            width: 26,
                          ),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            child: Text('$dob', style: TextStyle(fontSize: 18)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      //address
                      Row(
                        children: [
                          Text(
                            'Address: ',
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(
                            width: 61,
                          ),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            child: Text('$address', style: TextStyle(fontSize: 18)),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 130),
                        child: ElevatedButton(
                            child: Text("Edit", style: TextStyle(fontSize: 13)),
                            style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.symmetric(
                                      horizontal: 25, vertical: 12),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.green.shade700),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        side: BorderSide(
                                            color: Colors.green.shade700)))),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => HSEditProfilePage())));
                            }),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
