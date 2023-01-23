// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';

class RequestAppTabBar extends StatefulWidget {
  const RequestAppTabBar({super.key});

  @override
  State<RequestAppTabBar> createState() => _RequestAppTabBarState();
}

class _RequestAppTabBarState extends State<RequestAppTabBar> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
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
                        Icons.account_circle_outlined,
                        size: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Soobin',
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
                      //first line
                      SizedBox(
                        width: 60,
                      ),
                      Icon(
                        Icons.call,
                        size: 20,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '019-16130328',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      SizedBox(
                        width: 65,
                      ),
                      
                      Text(
                        'Request to change appointment slot',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  //third line
                  //from part
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 65),
                    child: Text('From:'),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      SizedBox(
                        width: 85,
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
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
    
                  //to part
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 65),
                    child: Text('To:'),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      SizedBox(
                        width: 85,
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
                        'Monday, 18 July',
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
                    padding: const EdgeInsets.symmetric(horizontal: 65),
                    child: Text('Reason:'),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 65),
                    child: Text('Having a meeting on friday'),
                  ),
                  SizedBox(
                    height: 15,
                  ),
    
                  //button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //button 1
                        TextButton(
                            child:
                                Text("Approve", style: TextStyle(fontSize: 13)),
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 12),
                                ),
                                foregroundColor: MaterialStateProperty.all<Color>(
                                    Colors.green),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                        side: BorderSide(color: Colors.green)))),
                            onPressed: () => null),
                        SizedBox(width: 25),
                        //button 2
                        ElevatedButton(
                            child: Text("Reject", style: TextStyle(fontSize: 13)),
                            style: ButtonStyle(
                                foregroundColor: MaterialStateProperty.all<Color>(
                                    Colors.white),
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.symmetric(
                                      horizontal: 45, vertical: 12),
                                ),
                                backgroundColor: MaterialStateProperty.all<Color>(
                                    Colors.red.shade700),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                        side: BorderSide(
                                            color: Colors.red.shade700)))),
                            onPressed: () {})
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
