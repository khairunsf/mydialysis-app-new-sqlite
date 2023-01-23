import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mydialysis_app/screens/dialysis%20staff/home_dialysis_staff.dart';
import 'package:mydialysis_app/screens/dialysis%20staff/widget%20ds/bottomBarDS.dart';

import 'auth.dart';

class DialysisStaffCheckPage extends StatelessWidget {
  const DialysisStaffCheckPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return DSBottomBar();
          } else {
            return AuthPage();
          }
        },
      ),
    );
  }
}
