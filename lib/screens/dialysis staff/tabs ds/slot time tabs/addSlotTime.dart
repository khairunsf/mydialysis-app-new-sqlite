// ignore_for_file: prefer_const_constructors, sort_child_properties_last, unnecessary_new

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mydialysis_app/model/slotModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../db/databaseHelper.dart';
import '../../slot time ds/slotTimeDS.dart';

class AddDSSlotTimeTabBar extends StatefulWidget {
  const AddDSSlotTimeTabBar({super.key});

  @override
  State<AddDSSlotTimeTabBar> createState() => _AddDSSlotTimeTabBarState();
}

class _AddDSSlotTimeTabBarState extends State<AddDSSlotTimeTabBar> {
  DatabaseHelper? _databaseHelper;
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  final _formKey = new GlobalKey<FormState>();

  DateFormat dateFormat = DateFormat("dd-MM-yyyy");
  TextEditingController stDateController = TextEditingController();
  TextEditingController stTimeCon = TextEditingController();
  TextEditingController stPnameController = TextEditingController();

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

  //add slotTime function
  Future<SlotModel?> addSlotTime() async {
    print('success');
    await _databaseHelper!.insertSlot({
      'sdate': stDateController.text.trim(),
      'stime': stTimeCon.text.trim(),
      'pname': stPnameController.text.trim(),
    });
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Slot Time added Successfully'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => DSSlotTimePage()),
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
                  'Add Slot Time',
                  style: TextStyle(fontSize: 18),
                ),

                SizedBox(
                  height: 15,
                ),

                //uname textfield
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
                    controller: stPnameController,
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
                    controller: stDateController,
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
                          stDateController.text = dateFormat.format(pickeddate);
                        });
                      }
                    }),
                  ),
                ),
                SizedBox(
                  height: 15,
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
                    controller: stTimeCon,
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
                              stTimeCon.text =
                                  pickedtime.format(context).toString();
                            });
                          }
                        }),
                      ),
                    ),
                SizedBox(
                  height: 20,
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
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: BorderSide(
                                        color: Colors.green.shade700)))),
                    onPressed: addSlotTime),
                SizedBox(
                  height: 10,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
