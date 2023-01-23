// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, avoid_returning_null_for_void

import 'package:flutter/material.dart';
import 'package:mydialysis_app/screens/patient/appointment/reschedule_appointment.dart';

class PatientAppTabBarUpcoming extends StatelessWidget {
  const PatientAppTabBarUpcoming({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200,
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
                        size: 35,
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
                        width: 50,
                      ),
                      Icon(
                        Icons.local_hospital_outlined,
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
                        width: 50,
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
                        '10:00 AM',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Icon(
                        Icons.calendar_month_outlined,
                        size: 15,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Friday, 15 July',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Icon(
                        Icons.done,
                        size: 15,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Confirmed',
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
                    padding: const EdgeInsets.symmetric(horizontal: 63.0),
                    child: Row(
                      children: [
                        TextButton(
                            child: Text("Approved",
                                style: TextStyle(fontSize: 13)),
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.symmetric(
                                      horizontal: 35, vertical: 12),
                                ),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.green),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        side:
                                            BorderSide(color: Colors.green)))),
                            onPressed: () => null),
                        SizedBox(width: 20),
                        ElevatedButton(
                            child: Text("Reschedule",
                                style: TextStyle(fontSize: 13)),
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
                                          AppointmentReschedule())));
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
    );
  }
}
