// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, non_constant_identifier_names, depend_on_referenced_packages, prefer_final_fields, unused_field, avoid_print, unnecessary_new

import 'package:flutter/material.dart';
import 'package:mydialysis_app/db/databaseHelper.dart';
import 'package:mydialysis_app/main.dart';
import 'package:intl/intl.dart';
import 'package:mydialysis_app/services/signupRetry.dart';

class SignupPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const SignupPage({super.key, required this.showLoginPage});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = new GlobalKey<FormState>();
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

  String? selectedRole;
  List<String> _roleType = <String>[
    'Patient',
    'Dialysis Staff',
    'Hospital Staff'
  ];

  //text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _nameController = TextEditingController();
  final _givencodeController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _dobController = TextEditingController();
  final _addressController = TextEditingController();
  final _icController = TextEditingController();
  DateFormat dateFormat = DateFormat("dd-MM-yyyy");

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _givencodeController.dispose();
    _phoneNumberController.dispose();
    _dobController.dispose();
    _addressController.dispose();
    _confirmPasswordController.dispose();
    _icController.dispose();
    super.dispose();
  }

  Future signUp() async {
    print(_nameController);
    print(_confirmPasswordController);
    if (passwordConfirmed()) {
      //create user
      await _databaseHelper!.insertUser({
        'uname': _nameController.text.trim(),
        'uemail': _emailController.text.trim(),
        'ugivenCode': _givencodeController.text.trim(),
        'uphoneNum': _phoneNumberController.text.trim(),
        'udob': _dobController.text.trim(),
        'uaddress': _addressController.text.trim(),
        'urole': selectedRole,
        'upwd': _passwordController.text.trim(),
        'ucpwd': _confirmPasswordController.text.trim(),
        'uic': _icController.text.trim(),
      });

      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Sign Up Successfully'),
          content: const Text('Welcome To myDialysis! Login now'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => MyApp()),
              ),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } else {
      return showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Password is not match'),
          content: const Text('Try Again'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => RetryPage()),
              ),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmPasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
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

                  //Sign Up name
                  Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 20, color: Colors.green[900]),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  //Name textfield
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Name',
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
                      controller: _nameController,
                      validator: (value) {
                        if (value == "") {
                          return "Please Enter Name";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 20),
                        filled: true,
                        fillColor: Colors.blueGrey[50],
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey)),
                        hintText: 'Enter Name',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
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
                        return null;
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
                    height: 15,
                  ),

                  //Phone Number textfield
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Phone Number',
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
                      controller: _phoneNumberController,
                      validator: (value) {
                        if (value == "") {
                          return "Please Enter Phone Number";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 20),
                        filled: true,
                        fillColor: Colors.blueGrey[50],
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey)),
                        hintText: 'Enter Phone Number',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  //IC Number textfield
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'IC Number',
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
                      controller: _icController,
                      validator: (value) {
                        if (value == "") {
                          return "Please Enter IC Number";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 20),
                        filled: true,
                        fillColor: Colors.blueGrey[50],
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey)),
                        hintText: 'Enter IC Number',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  //Date of Birth textfield
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Date of Birth',
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
                      controller: _dobController,
                      validator: (value) {
                        if (value == "") {
                          return "Please Select Date of Birth";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 20),
                        filled: true,
                        fillColor: Colors.blueGrey[50],
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey)),
                        hintText: 'Select Date',
                      ),
                      onTap: (() async {
                        DateTime? pickeddate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1700),
                            lastDate: DateTime(2101));
                        if (pickeddate != null) {
                          setState(() {
                            _dobController.text = dateFormat.format(pickeddate);
                          });
                        }
                      }),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  //Address textfield
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Address',
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
                      controller: _addressController,
                      validator: (value) {
                        if (value == "") {
                          return "Please Enter Address";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 20),
                        filled: true,
                        fillColor: Colors.blueGrey[50],
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey)),
                        hintText: 'Enter Address',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
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
                        return null;
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
                    height: 15,
                  ),

                  //Confirm Password textfield
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Confirm Password',
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
                      controller: _confirmPasswordController,
                      obscureText: true,
                      validator: (value) {
                        if (value == "") {
                          return "Please Enter Password For Confirmation";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 20),
                        filled: true,
                        fillColor: Colors.blueGrey[50],
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey)),
                        hintText: 'Enter Password For Confirmation',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  //Role
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Role',
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
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 20),
                        filled: true,
                        fillColor: Colors.blueGrey[50],
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey)),
                        hintText: 'Select Your Role',
                      ),
                      items: _roleType
                          .map((String value) => DropdownMenuItem(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedRole = value;
                        });
                      },
                      value: selectedRole,
                      isExpanded: false,
                      validator: (value) {
                        if (value == null) {
                          return "Role is required";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  //Given Code
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Given Code',
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
                      controller: _givencodeController,
                      validator: (value) {
                        if (value == "") {
                          return "Please Enter Given Code";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 20),
                        filled: true,
                        fillColor: Colors.blueGrey[50],
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey)),
                        hintText: 'Enter Given Code',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  //Button
                  GestureDetector(
                    onTap: (() {
                      if (_formKey.currentState!.validate()) {
                        signUp();
                      } else {
                        print("Valid Failed");
                      }
                    }),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        decoration: BoxDecoration(
                          color: Colors.green[700],
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(bottom: 40.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account? ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: widget.showLoginPage,
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.indigo[400],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
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
