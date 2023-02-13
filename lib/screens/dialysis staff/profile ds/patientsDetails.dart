// ignore_for_file: file_names, prefer_const_constructors, curly_braces_in_flow_control_structures, sort_child_properties_last, non_constant_identifier_names, unused_element

import 'package:flutter/material.dart';
import 'package:mydialysis_app/model/userModel.dart';
import 'package:mydialysis_app/screens/dialysis%20staff/profile%20ds/patientProfile.dart';
import 'package:mydialysis_app/screens/dialysis%20staff/widget%20ds/secondpartDS.dart';
import 'package:mydialysis_app/screens/dialysis%20staff/widget%20ds/topBarDS.dart';
import 'package:mydialysis_app/screens/hospital%20staff/profile%20hs/patientProfileHS.dart';
import 'package:mydialysis_app/screens/hospital%20staff/widgets%20hs/secondpartHS.dart';
import 'package:mydialysis_app/screens/hospital%20staff/widgets%20hs/topBarHS.dart';

class PatientDetailsDS extends StatelessWidget {
  UserModel? patient;
  PatientDetailsDS(this.patient, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            DSTopBar(),
            SecondPartDSPatient(),
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
                            child: Text(
                              '${patient!.uname}',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      //Ic part
                      Row(
                        children: [
                          Text(
                            'IC No: ',
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(
                            width: 80,
                          ),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              '${patient!.uic}',
                              style: TextStyle(fontSize: 18),
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
                            child: Text(
                              '${patient!.uphoneNum}',
                              style: TextStyle(fontSize: 18),
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
                            child: Text(
                              '${patient!.uemail}',
                              style: TextStyle(fontSize: 18),
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
                            child: Text(
                              '${patient!.udob}',
                              style: TextStyle(fontSize: 18),
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
                            child: Text(
                              '${patient!.uaddress}',
                              style: TextStyle(fontSize: 18),
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
                            'Given Code:    ',
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              '${patient!.ugivenCode}',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                      

                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 130),
                        child: ElevatedButton(
                            child: Text("Back", style: TextStyle(fontSize: 13)),
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
                                      builder: ((context) =>
                                          PatientProfileDS())));
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
