// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mydialysis_app/screens/patient/time%20slot/request_slotTime.dart';

class PatientSTTabBarUpcoming extends StatefulWidget {
  const PatientSTTabBarUpcoming({super.key});

  @override
  State<PatientSTTabBarUpcoming> createState() =>
      _PatientSTTabBarUpcomingState();
}

class _PatientSTTabBarUpcomingState extends State<PatientSTTabBarUpcoming> {
  String textHolder = 'Approve';

  void clickFunction() {
    setState(() {
      textHolder = 'Approved';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 235, 243, 249),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 30,
                          ),
                          Icon(
                            Icons.hourglass_empty_rounded,
                            size: 35,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Weekly slot time',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 75,
                          ),
                          Icon(
                            Icons.calendar_today_rounded,
                            size: 15,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Wednesday, September 13',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 75,
                          ),
                          Icon(
                            Icons.access_time_filled_rounded,
                            size: 15,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '10:00AM - 02:00PM',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35.0),
                        child: Row(
                          children: [
                            TextButton(
                                child: Text(textHolder,
                                    style: TextStyle(fontSize: 13)),
                                style: ButtonStyle(
                                    padding:
                                        MaterialStateProperty.all<EdgeInsets>(
                                      EdgeInsets.symmetric(
                                          horizontal: 40, vertical: 12),
                                    ),
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.green),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            side: BorderSide(
                                                color: Colors.green)))),
                                onPressed: () => clickFunction()),
                            SizedBox(width: 20),
                            ElevatedButton(
                                child: Text("Request Slot Time",
                                    style: TextStyle(fontSize: 13)),
                                style: ButtonStyle(
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    padding:
                                        MaterialStateProperty.all<EdgeInsets>(
                                      EdgeInsets.symmetric(
                                          horizontal: 18, vertical: 12),
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
                                                color:
                                                    Colors.green.shade700)))),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              SlotTimeRequest())));
                                })
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
