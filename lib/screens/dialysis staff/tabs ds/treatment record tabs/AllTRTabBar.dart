import 'package:flutter/material.dart';
import 'package:mydialysis_app/screens/dialysis%20staff/widget%20ds/secondpartDS.dart';
import 'package:mydialysis_app/screens/dialysis%20staff/widget%20ds/topBarDS.dart';

import '../../treatment record ds/detailsTR.dart';

class AllDSTreatmentRecordTabBar extends StatefulWidget {
  const AllDSTreatmentRecordTabBar({super.key});

  @override
  State<AllDSTreatmentRecordTabBar> createState() => _AllDSTreatmentRecordTabBarState();
}

class _AllDSTreatmentRecordTabBarState extends State<AllDSTreatmentRecordTabBar> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              //3rd part
              Container(
                padding: EdgeInsets.only(top: 15),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 245, 249, 254),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        Icon(
                          Icons.folder_open_outlined,
                          size: 25,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Patient Name',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
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
                          'Saturday, 30 April',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(
                          width: 75,
                        ),
                        Icon(
                          Icons.access_time_filled_outlined,
                          size: 15,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '02:00 PM - 06:00 PM',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.only(left: 200),
                      child: ElevatedButton(
                        child:
                            Text("See Details", style: TextStyle(fontSize: 13)),
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 12),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.green.shade700),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: BorderSide(
                                        color: Colors.green.shade700)))),
                        onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    const DSTreatmentRecordDetails())),
                      ),
                    ),
                  
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: double.infinity,
                      height: 10,
                      decoration: BoxDecoration(color: Colors.white),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
  }
}