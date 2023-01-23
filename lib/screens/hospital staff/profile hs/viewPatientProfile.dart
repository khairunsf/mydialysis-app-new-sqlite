// ignore_for_file: file_names, prefer_const_constructors, curly_braces_in_flow_control_structures, sort_child_properties_last

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mydialysis_app/screens/hospital%20staff/profile%20hs/patientProfile.dart';
import 'package:mydialysis_app/screens/hospital%20staff/widgets%20hs/secondpartHS.dart';
import 'package:mydialysis_app/screens/hospital%20staff/widgets%20hs/topBarHS.dart';
import 'package:mydialysis_app/screens/patient/widgets%20patient/topbar.dart';

class HSviewPatientPage extends StatefulWidget {
  const HSviewPatientPage({super.key});

  @override
  State<HSviewPatientPage> createState() => _HSviewPatientPageState();
}

class _HSviewPatientPageState extends State<HSviewPatientPage> { //tukar data later
  final user = FirebaseAuth.instance.currentUser!;
  String? pName;
  String? pNumber;
  String? pEmail;
  String? pDOB;
  String? pAddress;

  Future _fetch() async {
    final firebaseUser = await FirebaseAuth.instance.currentUser;
    if (firebaseUser != null)
      await FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUser.uid)
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
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            HSTopBar(),
            SecondPartHSViewPatientProfile(),
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
                            width: 245,
                            height: 35,
                            decoration: BoxDecoration(
                              color: Colors.grey[50],
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: FutureBuilder(
                              future: _fetch(),
                              builder: ((context, snapshot) {
                                if (snapshot.connectionState !=
                                    ConnectionState.done)
                                  return Text('Loading..');
                                return Text('$pName');
                              }),
                            ),
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
                            width: 245,
                            height: 35,
                            decoration: BoxDecoration(
                              color: Colors.grey[50],
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: FutureBuilder(
                              future: _fetch(),
                              builder: ((context, snapshot) {
                                if (snapshot.connectionState !=
                                    ConnectionState.done)
                                  return Text('Loading..');
                                return Text('$pNumber');
                              }),
                            ),
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
                            width: 245,
                            height: 35,
                            decoration: BoxDecoration(
                              color: Colors.grey[50],
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: FutureBuilder(
                              future: _fetch(),
                              builder: ((context, snapshot) {
                                if (snapshot.connectionState !=
                                    ConnectionState.done)
                                  return Text('Loading..');
                                return Text('$pEmail');
                              }),
                            ),
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
                            width: 245,
                            height: 35,
                            decoration: BoxDecoration(
                              color: Colors.grey[50],
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: FutureBuilder(
                              future: _fetch(),
                              builder: ((context, snapshot) {
                                if (snapshot.connectionState !=
                                    ConnectionState.done)
                                  return Text('Loading..');
                                return Text('$pDOB');
                              }),
                            ),
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
                            width: 245,
                            height: 35,
                            decoration: BoxDecoration(
                              color: Colors.grey[50],
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: FutureBuilder(
                              future: _fetch(),
                              builder: ((context, snapshot) {
                                if (snapshot.connectionState !=
                                    ConnectionState.done)
                                  return Text('Loading..');
                                return Text('$pAddress');
                              }),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 306),
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
                                      builder: ((context) => HSPatientProfilePage())));
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