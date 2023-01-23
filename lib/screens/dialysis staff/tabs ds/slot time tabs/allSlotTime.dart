// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class AllDSSlotTimeTabBar extends StatefulWidget {
  const AllDSSlotTimeTabBar({super.key});

  @override
  State<AllDSSlotTimeTabBar> createState() => _AllDSSlotTimeTabBarState();
}

class _AllDSSlotTimeTabBarState extends State<AllDSSlotTimeTabBar> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
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
                        Icons.hourglass_empty_rounded,
                        size: 35,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Patient Name',
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
                        width: 70,
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
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      SizedBox(
                        width: 70,
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
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      SizedBox(
                        width: 250,
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
                            color: Colors.blue),
                      ),
                    ],
                  ),
                  SizedBox(height: 15,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
