// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures, depend_on_referenced_packages, sort_child_properties_last

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mydialysis_app/screens/patient/profile/profile_patient.dart';
import 'package:mydialysis_app/screens/patient/widgets%20patient/2ndpart.dart';
import 'package:mydialysis_app/screens/patient/widgets%20patient/topbar.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../db/databaseHelper.dart';

class EditProfilePatient extends StatefulWidget {
  const EditProfilePatient({super.key});

  @override
  State<EditProfilePatient> createState() => _EditProfilePatientState();
}

class _EditProfilePatientState extends State<EditProfilePatient> {
  final _formKey = new GlobalKey<FormState>();
  DatabaseHelper? _databaseHelper;
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();

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

  TextEditingController pNameController = TextEditingController();
  TextEditingController pPhoneNumberController = TextEditingController();
  TextEditingController pEmailController = TextEditingController();
  TextEditingController pDOBController = TextEditingController();
  TextEditingController pAddressController = TextEditingController();
  bool isLoading = false;
  String? patient;
  DateFormat dateFormat = DateFormat("dd-MM-yyyy");

  Future saveChanges(int uid) async {
    await _databaseHelper!.updateUser(uid, {
      'uname': pNameController.text.trim(),
      'uemail': pEmailController.text.trim(),
      'uphoneNum': pPhoneNumberController.text.trim(),
      'udob': pDOBController.text.trim(),
      'uaddress': pAddressController.text.trim(),
    });
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Sign Up Successfully'),
        content: const Text('Welcome To myDialysis! Login now'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => ProfilePage()),
            ),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              //1st part
              TopBar(),
              //2nd part
              SecondPartProfileEdit(),
              //3rd part
              //Name textfield
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Name',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[50],
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: pNameController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Name',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),

              //Email textfield
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Email Address',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[50],
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: pEmailController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Email Address',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),

              //Phone Number textfield
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Phone Number',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[50],
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: pPhoneNumberController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Phone Number',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),

              //Date of Birth textfield
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Date of Birth',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[50],
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: pDOBController,
                      decoration: InputDecoration(
                        icon: Icon(Icons.calendar_month_outlined),
                        border: InputBorder.none,
                        hintText: 'Select Date',
                      ),
                      onTap: (() async {
                        DateTime? pickeddate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1700),
                            lastDate: DateTime(2101));
                        if (pickeddate != null) {
                          setState(() {
                            pDOBController.text = dateFormat.format(pickeddate);
                          });
                        }
                      }),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),

              //Address textfield
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Address',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[50],
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: pAddressController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Address',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 20,
              ),

              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 140),
                    child: ElevatedButton(
                        child: Text("Save Changes",
                            style: TextStyle(fontSize: 13)),
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 12),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.green.shade700),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: BorderSide(
                                        color: Colors.green.shade700)))),
                        onPressed: (() {
                        })),
                  ),
                ],
              ),
              SizedBox(
                height: 35,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
