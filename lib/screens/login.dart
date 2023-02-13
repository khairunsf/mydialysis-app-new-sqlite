// ignore_for_file: deprecated_member_use, prefer_const_constructors, body_might_complete_normally_nullable, unused_local_variable, unrelated_type_equality_checks, use_build_context_synchronously, unnecessary_new, prefer_typing_uninitialized_variables, avoid_print, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:mydialysis_app/model/userModel.dart';
import 'package:mydialysis_app/screens/dialysis%20staff/widget%20ds/bottomBarDS.dart';
import 'package:mydialysis_app/screens/forgot_pwd.dart';
import 'package:mydialysis_app/screens/hospital%20staff/widgets%20hs/bottomBarHS.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../db/databaseHelper.dart';
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
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  final _formKey = new GlobalKey<FormState>();
  String? userRole;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future initDb() async {
    await _databaseHelper!.database;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _databaseHelper = DatabaseHelper();
    initDb();
  }

  //Login Function
  Future<UserModel?> login() async {
    print('Success');
    String email = _emailController.text;
    String password = _passwordController.text;

    await _databaseHelper!.getLoginUser(email, password).then((userData) {
      if (userData != null) {
        setSP(userData).whenComplete(() async {
          print(userData.urole);
          if (userData.urole == 'Patient') {
            final prefs = await SharedPreferences.getInstance();
            prefs.setBool('isLoggedIn', true);
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => PBottomBarPage()),
                (Route<dynamic> route) => false);
          } else if (userData.urole == 'Dialysis Staff') {
            final prefs = await SharedPreferences.getInstance();
            prefs.setBool('isLoggedIn', true);
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => DSBottomBarPage()),
                (Route<dynamic> route) => false);
          } else if (userData.urole == 'Hospital Staff') {
            final prefs = await SharedPreferences.getInstance();
            prefs.setBool('isLoggedIn', true);
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => HSBottomBarPage()),
                (Route<dynamic> route) => false);
          } else {
            AlertDialog(
              title: Text("Error: User Not Found"),
            );
          }
        }).catchError((error) {
          print(error);
          AlertDialog(
            title: Text("Error: Login Fail"),
          );
        });
      } else {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('User not found. Please sign up'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    });
  }

  Future setSP(UserModel user) async {
    final SharedPreferences sp = await prefs;

    sp.setInt("user_id", user.uid!);
    sp.setString("user_ic", user.uic!);
    sp.setString("user_name", user.uname!);
    sp.setString("email", user.uemail!);
    sp.setString("password", user.upwd!);
    sp.setString("phone_num", user.uphoneNum!);
    sp.setString("user_dob", user.udob!);
    sp.setString("user_address", user.uaddress!);
    sp.setString("user_code", user.ugivenCode!);
    sp.setString("user_role", user.urole!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          reverse: true,
          child: Center(
            child: Form(
              key: _formKey,
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
                    child: TextFormField(
                      controller: _emailController,
                      validator: (value) {
                        if (value == "") {
                          return "Please Enter Email";
                        }
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 20),
                        filled: true,
                        fillColor: Colors.blueGrey[50],
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey)),
                        hintText: 'Enter Email Address',
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
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      validator: (value) {
                        if (value == "") {
                          return "Please Enter Password";
                        }
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 20),
                        filled: true,
                        fillColor: Colors.blueGrey[50],
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey)),
                        hintText: 'Enter Password',
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
                      onPressed: (() {
                        if (_formKey.currentState!.validate()) {
                          login();
                        } else {
                          print("Valid Failed");
                        }
                      }),
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
      ),
    );
  }
}
