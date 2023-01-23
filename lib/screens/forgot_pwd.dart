// ignore_for_file: prefer_const_constructors, sort_child_properties_last, use_build_context_synchronously, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mydialysis_app/services/auth.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content:
                  Text('Password Reset Link Sent! Please check your email.'),
            );
          });
      Navigator.of(context)
          .push(MaterialPageRoute(builder: ((context) => AuthPage())));
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[100],
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //text
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              'Enter Your Registered Email and we will send you a password reset link',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),

          SizedBox(height: 10),

          //email textfield
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

          SizedBox(height: 10),

          //Button
          MaterialButton(
            onPressed: passwordReset,
            child: Text('Reset Password'),
            color: Colors.blue[50],
          ),
        ],
      ),
    );
  }
}
