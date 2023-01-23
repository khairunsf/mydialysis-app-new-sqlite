// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mydialysis_app/screens/hospital%20staff/widgets%20hs/bottomBarHS.dart';
import 'auth.dart';

class HospitalStaffCheckPage extends StatelessWidget {
  const HospitalStaffCheckPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HSBottomBarPage();
          } else {
            return AuthPage();
          }
        },
      ),
    );
  }
}
