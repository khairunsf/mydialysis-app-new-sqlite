// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:mydialysis_app/db/databaseHelper.dart';
import 'package:mydialysis_app/screens/patient/appointment/appointment_patient.dart';
import 'package:mydialysis_app/screens/patient/home_patient.dart';
import 'package:mydialysis_app/screens/patient/payment/payment_patient.dart';
import 'package:mydialysis_app/screens/patient/profile/profile_patient.dart';
import 'package:mydialysis_app/screens/patient/time%20slot/time_slot_patient.dart';

class PBottomBarPage extends StatefulWidget {
  const PBottomBarPage({super.key});

  @override
  State<PBottomBarPage> createState() => _PBottomBarPageState();
}

class _PBottomBarPageState extends State<PBottomBarPage> {

  int _selectedIndex = 0;

  void _navigateButtombar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    HomePage(),
    TimeSlotPage(),
    AppointmentPage(),
    PaymentPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        color: Color.fromARGB(255, 238, 248, 251),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
          child: GNav(
            backgroundColor: Color.fromARGB(255, 238, 248, 251),
            tabBackgroundColor: Color.fromARGB(255, 212, 238, 252),
            hoverColor: Colors.blue,
            activeColor: Colors.blue,
            gap: 8,
            onTabChange: _navigateButtombar,
            padding: EdgeInsets.all(15),
            tabs: [
              GButton(icon: Icons.home),
              GButton(icon: Icons.access_time),
              GButton(icon: Icons.calendar_month_outlined),
              GButton(icon: Icons.paid_outlined),
              GButton(icon: Icons.account_circle),
            ],
          ),
        ),
      ),
    );
  }
}
