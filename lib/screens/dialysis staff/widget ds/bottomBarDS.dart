// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../home_dialysis_staff.dart';
import '../payment ds/paymentDS.dart';
import '../profile ds/profileDS.dart';
import '../slot time ds/slotTimeDS.dart';
import '../treatment record ds/treatmentRecordDS.dart';

class DSBottomBar extends StatefulWidget {
  const DSBottomBar({super.key});

  @override
  State<DSBottomBar> createState() => _DSBottomBarState();
}

class _DSBottomBarState extends State<DSBottomBar> {

  final user = FirebaseAuth.instance.currentUser;

  int _selectedIndex = 0;

  void _navigateButtombar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    DSHomePage(),
    DSSlotTimePage(),
    DSTreatmentRecordPage(),
    DSPaymentPage(),
    DSProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        color: Color.fromARGB(255, 238, 248, 251),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
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
              GButton(icon: Icons.folder_open_outlined),
              GButton(icon: Icons.paid_outlined),
              GButton(icon: Icons.account_circle),
            ],
          ),
        ),
      ),
    );
  }
}