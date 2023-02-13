// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:mydialysis_app/model/paymentModel.dart';
import 'package:mydialysis_app/screens/patient/payment/payment_patient.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../db/databaseHelper.dart';
import '../widgets patient/2ndpart.dart';
import '../widgets patient/topbar.dart';

class PaymentGateway extends StatefulWidget {
  const PaymentGateway({super.key});

  @override
  State<PaymentGateway> createState() => _PaymentGatewayState();
}

class _PaymentGatewayState extends State<PaymentGateway> {
  DatabaseHelper? _databaseHelper;
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  final _formKey = new GlobalKey<FormState>();

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

  Future saveChanges() async {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Payment Successful'),
        content: const Text('Thank you for your payment.'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => PaymentPage()),
            ),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              //1st part
              TopBar(),
              //2nd part
              SecondPartGateway(),
              //3rd part
              Container(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 235, 243, 249),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Select Payment Method'),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 1,
                          groupValue: _value,
                          onChanged: ((value) {
                            setState(() {
                              _value = value!;
                            });
                          }),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.credit_card_outlined),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Credit/Debit Card')
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 2,
                          groupValue: _value,
                          onChanged: ((value) {
                            setState(() {
                              _value = value!;
                            });
                          }),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.mobile_friendly_outlined),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Online Banking')
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 3,
                          groupValue: _value,
                          onChanged: ((value) {
                            setState(() {
                              _value = value!;
                            });
                          }),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.account_balance_wallet_outlined),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Credit/Debit Card')
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 160),
                          child: ElevatedButton(
                              child: Text("Pay Now",
                                  style: TextStyle(fontSize: 13)),
                              style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  padding:
                                      MaterialStateProperty.all<EdgeInsets>(
                                    EdgeInsets.symmetric(
                                        horizontal: 25, vertical: 12),
                                  ),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.green.shade700),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          side: BorderSide(
                                              color: Colors.green.shade700)))),
                              onPressed: (() {
                                showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: const Text('Payment Successful'),
                                    content:
                                        Text('Thank you for your payment.'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PaymentPage()),
                                        ),
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  ),
                                );
                              })),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
