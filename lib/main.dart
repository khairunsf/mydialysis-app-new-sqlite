// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mydialysis_app/screens/login.dart';
import 'package:mydialysis_app/screens/sign_up.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized;

  await initialization(null);

  runApp(const MyApp());
}

Future initialization(BuildContext? context) async {
  //load resources
  await Future.delayed(Duration(seconds: 3));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //boolean. initially, it show the login page
  bool showLoginPage = true;

  void toggleScreen() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: switchPages());
  }

  StatefulWidget switchPages() {
    if (showLoginPage) {
      return LoginPage(showSignupPage: toggleScreen);
    } else {
      return SignupPage(showLoginPage: toggleScreen);
    }
  }
}
