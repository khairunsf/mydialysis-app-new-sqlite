// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mydialysis_app/screens/patient/widgets%20patient/2ndpart.dart';
import 'package:mydialysis_app/screens/patient/widgets%20patient/topbar.dart';

class AppointmentDetails extends StatefulWidget {
  const AppointmentDetails({super.key});

  @override
  State<AppointmentDetails> createState() => _AppointmentDetailsState();
}

class _AppointmentDetailsState extends State<AppointmentDetails> {
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
              //2nd Part
              SecondPartAppointmentDetails(),
              //3rd part
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 235, 243, 249),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              //first line
                              SizedBox(
                                width: 30,
                              ),
                              Icon(
                                Icons.badge_outlined,
                                size: 30,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Dr. Mritha Shanmuganathan',
                                style: TextStyle(
                                  fontSize: 22,
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
                              SizedBox(
                                width: 40,
                              ),
                              Icon(
                                Icons.home_work_outlined,
                                size: 15,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Dialysis Specialist - Queen Hospital',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
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
                              SizedBox(
                                width: 40,
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
                                '02:00 PM',
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
                              SizedBox(width: 40,),
                              Icon(
                                Icons.calendar_month_outlined,
                                size: 15,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Monday, 15 August',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 250),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.done,
                                  size: 15,
                                  color: Colors.green.shade700,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Completed',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.green.shade700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text('Appointment Review'),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.only(left: 20, right: 20),
                            padding: const EdgeInsets.only(top: 10, bottom: 20, left: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(color: Colors.black),
                                color: Colors.white),
                            child: Text('Patient need to control sugar intake.'),
                          ),
                          SizedBox(height: 15,),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
