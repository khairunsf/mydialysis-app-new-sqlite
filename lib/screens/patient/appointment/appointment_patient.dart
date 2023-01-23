// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mydialysis_app/screens/patient/tabs%20patient/p_appointment_upcoming.dart';
import 'package:mydialysis_app/screens/patient/tabs%20patient/p_appointment_completed.dart';
import 'package:mydialysis_app/screens/patient/widgets%20patient/2ndpart.dart';

import '../widgets patient/topbar.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              //1st part
              TopBar(),
              //2nd part
              SecondPartAppointment(),
              //3rd part + tab bar
              Container(
                width: 380,
                height: 55,
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
                        left: 40.0, right: 40.0, bottom: 0.2, top: 0.2),
                    indicator: BoxDecoration(
                      border: Border.all(color: Colors.green.shade700),
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.green.shade700,
                    ),
                    tabs: [
                      Tab(
                        text: 'Upcoming',
                      ),
                      Tab(
                        text: 'Completed',
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
                    PatientAppTabBarUpcoming(),
                    PatientAppTabBarCompleted(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
