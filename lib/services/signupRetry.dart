import 'package:flutter/material.dart';
import 'package:mydialysis_app/screens/login.dart';
import 'package:mydialysis_app/screens/sign_up.dart';

class RetryPage extends StatefulWidget {
  const RetryPage({super.key});

  @override
  State<RetryPage> createState() => _RetryPageState();
}

class _RetryPageState extends State<RetryPage> {
  //boolean. initially, it show the login page
  bool showSignupPage = true;

  void toggleScreen(){
    setState(() {
      showSignupPage = !showSignupPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignupPage) {
      return SignupPage(showLoginPage: toggleScreen);
    } else {
      return LoginPage(showSignupPage: toggleScreen);
    }
    }
  }

