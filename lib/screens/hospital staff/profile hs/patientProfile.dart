// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:mydialysis_app/screens/hospital%20staff/profile%20hs/viewPatientProfile.dart';
import 'package:mydialysis_app/screens/hospital%20staff/widgets%20hs/secondpartHS.dart';
import 'package:mydialysis_app/screens/hospital%20staff/widgets%20hs/topBarHS.dart';
import 'package:mydialysis_app/screens/patient/widgets%20patient/topbar.dart';

class HSPatientProfilePage extends StatefulWidget {
  const HSPatientProfilePage({super.key});

  @override
  State<HSPatientProfilePage> createState() => _HSPatientProfilePageState();
}

class _HSPatientProfilePageState extends State<HSPatientProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(247, 250, 254, 1.000),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              HSTopBar(),
              SecondPartHSpatientprofile(),
              SizedBox(
                height: 15,
              ),
              //content
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(color: Colors.white),
                    width: double.infinity,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            //first line
                            SizedBox(
                              width: 30,
                            ),
                            Icon(
                              Icons.account_circle_outlined,
                              size: 25,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Soobin',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        //second line
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            //first line
                            SizedBox(
                              width: 65,
                            ),
                            Icon(
                              Icons.mail_outline_rounded,
                              size: 18,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'soobin@gmail.commm',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        //third line
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            //first line
                            SizedBox(
                              width: 65,
                            ),
                            Icon(
                              Icons.call_outlined,
                              size: 18,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '019-16130328',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        //button 2
                        Padding(
                          padding: const EdgeInsets.only(left: 200),
                          child: ElevatedButton(
                              child:
                                  Text("View", style: TextStyle(fontSize: 13)),
                              style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  padding:
                                      MaterialStateProperty.all<EdgeInsets>(
                                    EdgeInsets.symmetric(
                                        horizontal: 45, vertical: 12),
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
                                        builder: (context) =>
                                            HSviewPatientPage()));
                              }),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
