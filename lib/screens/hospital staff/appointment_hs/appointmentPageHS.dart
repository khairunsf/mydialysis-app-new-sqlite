// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mydialysis_app/screens/hospital%20staff/tabs%20hs/AllAppointmentTabBar.dart';
import 'package:mydialysis_app/screens/hospital%20staff/tabs%20hs/RequestAppointmentTabBar.dart';
import 'package:mydialysis_app/screens/hospital%20staff/tabs%20hs/SetAppointmentTabBar.dart';
import 'package:mydialysis_app/screens/hospital%20staff/widgets%20hs/secondpartHS.dart';
import 'package:mydialysis_app/screens/hospital%20staff/widgets%20hs/topBarHS.dart';

class HSAppointmentPage extends StatefulWidget {
  const HSAppointmentPage({super.key});

  @override
  State<HSAppointmentPage> createState() => _HSAppointmentPageState();
}

class _HSAppointmentPageState extends State<HSAppointmentPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SafeArea(
            child: Column(
          children: [
            //1st part
            HSTopBar(),
            //2nd part
            SecondPartHSappointmentDetails(),
            //3rd part + tab bar
            Container(
              width: 380,
              padding: EdgeInsets.only(
                top: 10,
                bottom: 10,
              ),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(
                  7,
                ),
              ),
              child: Center(
                child: TabBar(
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.grey.shade400,
                  isScrollable: true,
                  labelPadding: EdgeInsets.only(
                      left: 30, right: 30, bottom: 0.2, top: 0.2),
                  indicator: BoxDecoration(
                    border: Border.all(color: Colors.green.shade700),
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.green.shade700,
                  ),
                  tabs: [
                    Tab(
                      text: '    All    ',
                    ),
                    Tab(
                      text: 'Set Appointment',
                    ),
                    Tab(
                      text: 'Request',
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: TabBarView(
                children: [
                  AllAppTabBar(),
                  SetAppTabBar(),
                  RequestAppTabBar(),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
