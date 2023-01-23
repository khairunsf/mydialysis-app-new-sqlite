// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';

class PatientSTTabBarCompleted extends StatelessWidget {
  const PatientSTTabBarCompleted({super.key});

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
                        'April, Week 2',
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
                        'Thursday, April 22',
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
                        '03:00PM 07:00PM',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Icon(
                        Icons.done,
                        size: 20,
                        color: Colors.green.shade600,
                      ),
                      Text(
                        '  Completed',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.green.shade600),
                      ),
                    ],
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
