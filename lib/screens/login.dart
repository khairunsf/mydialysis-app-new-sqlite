// ignore_for_file: deprecated_member_use, prefer_const_constructors, body_might_complete_normally_nullable, unused_local_variable, unrelated_type_equality_checks, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:mydialysis_app/model/userModel.dart';
import 'package:mydialysis_app/screens/dialysis%20staff/widget%20ds/bottomBarDS.dart';
import 'package:mydialysis_app/screens/forgot_pwd.dart';
import 'package:mydialysis_app/screens/hospital%20staff/widgets%20hs/bottomBarHS.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../db/databaseHelper.dart';
import '../services/check_dialysis_staff.dart';
import '../services/check_hospital_staff.dart';
import 'patient/widgets patient/bottombar.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showSignupPage;
  const LoginPage({
    Key? key,
    required this.showSignupPage,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  DatabaseHelper? _databaseHelper;

  Future initDb() async {
    await _databaseHelper!.database;
    setState(() {});
  }

  @override
  void initState() {
    _databaseHelper = DatabaseHelper();
    initDb();
    super.initState();
  }

  String? userRole;

  //Login Function
  Future<UserModel?> login(
      {required String email,
      required String password,
      required BuildContext context}) async {
    UserModel? user;
    String? uemail;
    String? upwd;
    String? urole;
    final data = await _databaseHelper!.getAllUser();
    if (data != null) {
      if (uemail == email && upwd == password) {
        if (urole == 'Patient') {
          final prefs = await SharedPreferences.getInstance();
          prefs.setBool('isLoggedIn', true);
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => PBottomBarPage())));
        } else if (urole == 'Dialysis Staff') {
          final prefs = await SharedPreferences.getInstance();
          prefs.setBool('isLoggedIn', true);
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => DSBottomBarPage())));
        } else if (userRole == 'Hospital Staff') {
          final prefs = await SharedPreferences.getInstance();
          prefs.setBool('isLoggedIn', true);
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => HSBottomBarPage())));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    //Create the textfield controller
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          reverse: true,
          child: Center(
            child: Column(
              children: [
                //App Logo
                Image(
                  image: AssetImage('images/mydialysis_logo.png'),
                  height: 200,
                  width: 200,
                ),

                //Login name
                Text(
                  'Login',
                  style: TextStyle(fontSize: 20, color: Colors.green[900]),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),

                //Email textfield
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Email Address',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blueGrey[50],
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter Email Address',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                //Password textfield
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Password',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blueGrey[50],
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter Password',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ForgotPasswordPage();
                          }));
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Colors.indigo[400],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 15,
                ),

                //Button
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  width: double.infinity,
                  child: RawMaterialButton(
                    fillColor: Colors.green[700],
                    elevation: 0.0,
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    onPressed: () async {
                      UserModel? user = await login(
                          email: _emailController.text,
                          password: _passwordController.text,
                          context: context);
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ),

                SizedBox(
                  height: 10,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      'New here? ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.showSignupPage,
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.indigo[400],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
