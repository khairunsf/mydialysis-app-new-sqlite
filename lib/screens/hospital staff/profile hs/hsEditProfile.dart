// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures, depend_on_referenced_packages

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mydialysis_app/screens/hospital%20staff/profile%20hs/hsProfile.dart';
import 'package:mydialysis_app/screens/hospital%20staff/widgets%20hs/secondpartHS.dart';
import 'package:mydialysis_app/screens/hospital%20staff/widgets%20hs/topBarHS.dart';
import '../../patient/widgets patient/topbar.dart';

class HSEditProfilePage extends StatefulWidget {
  const HSEditProfilePage({super.key});

  @override
  State<HSEditProfilePage> createState() => _HSEditProfilePageState();
}

class _HSEditProfilePageState extends State<HSEditProfilePage> {
  final user = FirebaseAuth.instance.currentUser;
  TextEditingController hsNameController = TextEditingController();
  TextEditingController hsPhoneNumberController = TextEditingController();
  TextEditingController hsEmailController = TextEditingController();
  TextEditingController hsDOBController = TextEditingController();
  TextEditingController hsAddressController = TextEditingController();
  bool isLoading = false;
  String? hospStaff;
  DateFormat dateFormat = DateFormat("dd-MM-yyyy");

  @override
  void initState() {
    super.initState();
    getHospStaff();
  }
  
getHospStaff() async {
  setState(() {
      isLoading = true;
    });
    final firebaseUser = await FirebaseAuth.instance.currentUser;
    if (firebaseUser != null)
      await FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUser.uid)
          .get()
          .then((value) {
        hsNameController.text = value.data()!['name'];
        hsPhoneNumberController.text = value.data()!['phonenumber'];
        hsEmailController.text = value.data()!['email'];
        hsDOBController.text = value.data()!['dob'];
        hsAddressController.text = value.data()!['address'];
        setState(() {
          isLoading = false;
        });
      });
}

  Future _updatePatientData() async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({
        'name': hsNameController.text,
        'email': hsEmailController.text,
        'phonenumber': hsPhoneNumberController.text,
        'dob': hsDOBController.text,
        'address': hsAddressController.text,
      });

      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          backgroundColor: Colors.green.shade700,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: const Icon(
            Icons.check_circle,
            color: Colors.white,
          ),
          content: const Text('Profile Updated Successfully',
              style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => HSProfilePage()),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: Container(
                  padding: EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
                  color: Colors.green.shade900,
                    child: Text(
                  'OK',
                  style: TextStyle(color: Colors.white),
                )),
              ),
            ),
          ],
        ),
      );
    } on FirebaseAuthException catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(e.message.toString()),
          );
        },
      );
    }
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
              HSTopBar(),
              //2nd part
              SecondPartHSeditprofile(),
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
                      controller: hsNameController,
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
                      controller: hsEmailController,
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
                      controller: hsPhoneNumberController,
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
                      controller: hsDOBController,
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
                            hsDOBController.text = dateFormat.format(pickeddate);
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
                      controller: hsAddressController,
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
                        onPressed: () {
                          _updatePatientData();
                        }),
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