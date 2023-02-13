// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mydialysis_app/screens/dialysis%20staff/directory%20ds/directoryDS.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../db/databaseHelper.dart';

class AddDirectoryTabBar extends StatefulWidget {
  const AddDirectoryTabBar({super.key});

  @override
  State<AddDirectoryTabBar> createState() => _AddDirectoryTabBarState();
}

class _AddDirectoryTabBarState extends State<AddDirectoryTabBar> {
  DatabaseHelper? _databaseHelper;
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  final _formKey = new GlobalKey<FormState>();
  
  TextEditingController _dcnameCon = TextEditingController();
  TextEditingController _dcaddressCon = TextEditingController();
  TextEditingController _dcnumberCon = TextEditingController();
  TextEditingController _dclogoCon = TextEditingController();
  TextEditingController _dckmCon = TextEditingController();
  TextEditingController _dcopenhCon = TextEditingController();
  TextEditingController _dcclosehCon = TextEditingController();
  TextEditingController _dcratingCon = TextEditingController();
  
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

  Future saveDirectory() async{
    await _databaseHelper!.insertDirectory({
      'dname': _dcnameCon.text.trim(),
      'daddress': _dcaddressCon.text.trim(),
      'dcnumber': _dcnumberCon.text.trim(),
      'dkm': _dckmCon.text.trim(),
      'dopenhr': _dcopenhCon.text.trim(),
      'dclosehr': _dcclosehCon.text.trim(),
      'drating': _dcratingCon.text.trim(),
    });
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Directory Data added Successfully'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => DSDirectoryPage()),
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
                  height: 10,
                ),
      
                Text(
                  'Directory Form',
                  style: TextStyle(fontSize: 18),
                ),
      
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
                        'Dialysis Center Name',
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
                    controller: _dcnameCon,
                    validator: (value) {
                      if (value == "") {
                        return "Center name is required";
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
                      hintText: 'Enter Center Name',
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              SizedBox(
                  height: 10,
                ),
                //BW textfield
                //Name textfield
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
                    controller: _dcaddressCon,
                    validator: (value) {
                      if (value == "") {
                        return "Address is required";
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
                      hintText: 'Enter Center Address',
                    ),
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
                        'Contact Number',
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
                    controller: _dcnumberCon,
                    validator: (value) {
                      if (value == "") {
                        return "Contact number is required";
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
                      hintText: 'Enter Contact Number',
                    ),
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
                        'Distance',
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
                    controller: _dckmCon,
                    validator: (value) {
                      if (value == "") {
                        return "Distance is required";
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
                      hintText: 'Enter Distance',
                    ),
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
                        'Open Time',
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
                    controller: _dcopenhCon,
                    validator: (value) {
                      if (value == "") {
                        return "Open time is required";
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
                              _dcopenhCon.text =
                                  pickedtime.format(context).toString();
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
                        'Close Time',
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
                    controller: _dcclosehCon,
                    validator: (value) {
                      if (value == "") {
                        return "Close time is required";
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
                              _dcclosehCon.text =
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
                        'Rating',
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
                    controller: _dcratingCon,
                    validator: (value) {
                      if (value == "") {
                        return "Rating is required";
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
                      hintText: 'Enter Rating',
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
                    onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          saveDirectory();
                        } else {
                          print("Valid Failed");
                        }
                      }
                    ),
                    SizedBox(height: 10,),
              ],
            )
          ],
        ),
      ),
    );
  }
}