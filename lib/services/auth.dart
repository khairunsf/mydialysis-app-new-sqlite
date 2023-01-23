import 'package:flutter/material.dart';
import 'package:mydialysis_app/screens/login.dart';
import 'package:mydialysis_app/screens/sign_up.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  //boolean. initially, it show the login page
  bool showLoginPage = true;

  void toggleScreen() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(showSignupPage: toggleScreen);
    } else {
      return SignupPage(showLoginPage: toggleScreen);
    }
  }
}
