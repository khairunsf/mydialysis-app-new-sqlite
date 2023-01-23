// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:mydialysis_app/screens/hospital%20staff/appointment_hs/appointmentPageHS.dart';
import 'package:mydialysis_app/screens/hospital%20staff/home_hospital_staff.dart';
import 'package:mydialysis_app/screens/hospital%20staff/profile%20hs/hsProfile.dart';

class HSBottomBarPage extends StatefulWidget {
  const HSBottomBarPage({super.key});

  @override
  State<HSBottomBarPage> createState() => _HSBottomBarPageState();
}

class _HSBottomBarPageState extends State<HSBottomBarPage> {
  final user = FirebaseAuth.instance.currentUser;

  int _selectedIndex = 0;

  void _navigateButtombar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    HSHomePage(),
    HSAppointmentPage(),
    HSProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        color: Color.fromARGB(255, 238, 248, 251),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
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
              GButton(icon: Icons.calendar_month_outlined),
              GButton(icon: Icons.account_circle),
            ],
          ),
        ),
      ),
    );
  }
}
