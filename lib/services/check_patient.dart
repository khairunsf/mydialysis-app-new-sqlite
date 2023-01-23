// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mydialysis_app/screens/patient/widgets%20patient/bottombar.dart';
import 'package:mydialysis_app/services/auth.dart';

class PatientCheckPage extends StatelessWidget {
  const PatientCheckPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return PBottomBarPage();
          } else {
            return AuthPage();
          }
        },
      ),
    );
  }
}
