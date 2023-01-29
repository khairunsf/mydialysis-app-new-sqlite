// ignore_for_file: prefer_const_constructors

import 'dart:core';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mydialysis_app/screens/dialysis%20staff/payment%20ds/paymentDS.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../db/databaseHelper.dart';

class AddBillTabBar extends StatefulWidget {
  const AddBillTabBar({super.key});

  @override
  State<AddBillTabBar> createState() => _AddBillTabBarState();
}

class _AddBillTabBarState extends State<AddBillTabBar> {
  DatabaseHelper? _databaseHelper;
  final _formKey = new GlobalKey<FormState>();
  DateFormat dateFormat = DateFormat("dd-MM-yyyy");
  TextEditingController _pnameCon = TextEditingController();
  TextEditingController _bdateCon = TextEditingController();
  TextEditingController _btimeCon = TextEditingController();
  TextEditingController _dtpriceCon = TextEditingController();
  TextEditingController _mealpriceCon = TextEditingController();
  TextEditingController _bstatusCon = TextEditingController();
  TextEditingController _totalpriceCon = TextEditingController();
  
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

  Future saveBill() async{
    await _databaseHelper!.insertPayment({
      'pname': _pnameCon.text.trim(),
      'bdate': _bdateCon.text.trim(),
      'btime': _btimeCon.text.trim(),
      'dtprice': _dtpriceCon.text.trim(),
      'mealprice': _mealpriceCon.text.trim(),
      'totalprice': _totalpriceCon.text.trim(),
      'bstatus': 'Pending',
    });
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Bill added Successfully'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => DSPaymentPage()),
            ),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            //content
            Column(
              children: [
                
                SizedBox(
                  height: 15,
                ),
      
                //Name textfield
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Patient Name',
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
                    controller: _pnameCon,
                    validator: (value) {
                      if (value == "") {
                        return "Patient name is required";
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
                      hintText: 'Enter Patient Name',
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              SizedBox(
                  height: 10,
                ),
                //date textfield
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Date',
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
                    controller: _bdateCon,
                    validator: (value) {
                      if (value == "") {
                        return "Date is required";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      icon: Icon(Icons.calendar_month_outlined),
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
                          _bdateCon.text = dateFormat.format(pickeddate);
                        });
                      }
                    }),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                
                //Time textfield
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Time',
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
                    controller: _btimeCon,
                    validator: (value) {
                      if (value == "") {
                        return "Time is required";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      icon: Icon(Icons.access_time),
                      contentPadding: EdgeInsets.only(left: 20),
                      filled: true,
                      fillColor: Colors.blueGrey[50],
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey)),
                      hintText: 'Select Time',
                    ),
                        onTap: (() async {
                          TimeOfDay? pickedtime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          if (pickedtime != null) {
                            setState(() {
                              _btimeCon.text =
                                  pickedtime.format(context).toString();
                            });
                          }
                        }),
                      ),
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
                        'Dialysis Treatment Charge',
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
                    controller: _dtpriceCon,
                    validator: (value) {
                      if (value == "") {
                        return "Price is required";
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
                      hintText: 'Enter Price',
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                //Price textfield
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Meal Charge',
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
                    controller: _mealpriceCon,
                    
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 20),
                      filled: true,
                      fillColor: Colors.blueGrey[50],
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey)),
                      hintText: 'Enter Price',
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                //Total textfield
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Total Charge',
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
                    controller: _totalpriceCon,
                    validator: (value) {
                      if (value == "") {
                        return "Price is required";
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
                      hintText: 'Enter Price',
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                
                
              SizedBox(
                  height: 15,
                ),
                
                //button
                ElevatedButton(
                    child: Text("Submit", style: TextStyle(fontSize: 16)),
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.green.shade700),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                side: BorderSide(color: Colors.green.shade700)))),
                    onPressed: saveBill),
                    SizedBox(height: 10,),
              ],
            )
          ],
        ),
      ),
    );
  }
}