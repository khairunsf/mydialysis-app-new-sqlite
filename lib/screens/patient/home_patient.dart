// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mydialysis_app/screens/patient/dc_directory/dc_directory.dart';
import 'package:mydialysis_app/screens/patient/treatment%20record/treatment_record.dart';
import 'package:mydialysis_app/screens/patient/widgets%20patient/topbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 242, 251, 253),
            borderRadius: BorderRadius.circular(10),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                //1st part
                TopBar(),

                SizedBox(
                  height: 10,
                ),

                //2nd part
                Container(
                  padding:
                      EdgeInsets.only(bottom: 30, top: 30, left: 20, right: 20),
                  decoration: BoxDecoration(color: Colors.white60),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //box 1
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) => DCDirectoryPage()),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(25.0),
                          width: 150,
                          height: 120,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(193, 214, 255, 1.000),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Icon(
                                  Icons.menu_book_outlined,
                                  size: 23,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Dialysis Center Directory',
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        ),
                      ),

                      //box 2
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) => TreatmentRecordPage()),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(25.0),
                          width: 150,
                          height: 120,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(192, 240, 255, 1.000),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Icon(Icons.folder_open)),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Treatment Record',
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 30,
                ),

                //3rd part (dialysis slot)

                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Next Dialysis Slot',
                        style: TextStyle(fontSize: 22),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text.rich(
                        TextSpan(
                          children: <InlineSpan>[
                            WidgetSpan(
                                child: Icon(
                              Icons.date_range_outlined,
                              size: 20,
                            )),
                            TextSpan(text: '  Date:  Thursday, May 5'),
                          ],
                        ),
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 15),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      Text.rich(
                        TextSpan(
                          children: <InlineSpan>[
                            WidgetSpan(
                                child: Icon(
                              Icons.access_time,
                              size: 20,
                            )),
                            TextSpan(text: '  Time:  11:00AM - 03:00PM'),
                          ],
                        ),
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 15),
                      ),

                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        padding: EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                          color: Colors.white60,
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),

                      //appointment time
                      Text(
                        'Next Appointment',
                        style: TextStyle(fontSize: 22),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text.rich(
                        TextSpan(
                          children: <InlineSpan>[
                            WidgetSpan(
                                child: Icon(
                              Icons.date_range_outlined,
                              size: 20,
                            )),
                            TextSpan(text: '  Date:  Friday, July 15'),
                          ],
                        ),
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 15),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text.rich(
                        TextSpan(
                          children: <InlineSpan>[
                            WidgetSpan(
                                child: Icon(
                              Icons.access_time,
                              size: 20,
                            )),
                            TextSpan(text: '  Time:  12:00PM - 04:00PM'),
                          ],
                        ),
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
