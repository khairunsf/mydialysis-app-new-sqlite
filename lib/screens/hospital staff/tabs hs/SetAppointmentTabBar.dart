// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:mydialysis_app/screens/hospital%20staff/appointment_hs/appointmentPageHS.dart';
import 'package:mydialysis_app/screens/hospital%20staff/widgets%20hs/secondpartHS.dart';
import 'package:mydialysis_app/screens/patient/widgets%20patient/topbar.dart';
import 'package:intl/intl.dart';

import '../../../db/databaseHelper.dart';

class SetAppTabBar extends StatefulWidget {
  const SetAppTabBar({super.key});

  @override
  State<SetAppTabBar> createState() => _SetAppTabBarState();
}

class _SetAppTabBarState extends State<SetAppTabBar> {
  DatabaseHelper? _databaseHelper;
  final _formKey = new GlobalKey<FormState>();
  //text controllers
  final _aplaceCon = TextEditingController();
  final _adateCon = TextEditingController();
  final _atimeCon = TextEditingController();
  final _pNameCon = TextEditingController();
  final _drNameCon = TextEditingController();
  final _drDetailCon = TextEditingController();
  final _drRoomCon = TextEditingController();
  final _astatusCon = TextEditingController();
  DateFormat dateFormat = DateFormat("dd-MM-yyyy");

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

  Future saveAppointment() async {
    await _databaseHelper!.insertAppointment({
      'pname': _pNameCon.text.trim(),
      'aplace': _aplaceCon.text.trim(),
      'adate': _adateCon.text.trim(),
      'atime': _atimeCon.text.trim(),
      'drname': _drNameCon.text.trim(),
      'drdetail': _drDetailCon.text.trim(),
      'drroom': _drRoomCon.text.trim(),
      'astatus': 'Pending',
    });
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Appointment added Successfully'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => HSAppointmentPage()),
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
      child: Column(
        children: [
          //content
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
              controller: _pNameCon,
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
            height: 15,
          ),

          //Place textfield
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Place',
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
              controller: _aplaceCon,
              validator: (value) {
                if (value == "") {
                  return "Place is required";
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
                hintText: 'Enter Place',
              ),
            ),
          ),
          SizedBox(
            height: 15,
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
              controller: _adateCon,
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
                    _adateCon.text = dateFormat.format(pickeddate);
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
              controller: _atimeCon,
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
                    _atimeCon.text = pickedtime.format(context).toString();
                  });
                }
              }),
            ),
          ),
          SizedBox(
            height: 15,
          ),

          //Dr Name textfield
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Doctor Name',
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
              controller: _drNameCon,
              validator: (value) {
                if (value == "") {
                  return "Doctor Name is required";
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
                hintText: 'Enter Doctor Name',
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),

          //dr detail textfield
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Doctors Detail',
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
              controller: _drDetailCon,
              validator: (value) {
                if (value == "") {
                  return "Doctor detail is required";
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
                hintText: 'Enter Doctor Detail',
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
                  'Doctor Room',
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
              controller: _drRoomCon,
              validator: (value) {
                if (value == "") {
                  return "Doctor room is required";
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
                hintText: 'Enter Doctor Room',
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          //button
          ElevatedButton(
              child: Text("Save", style: TextStyle(fontSize: 16)),
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  padding: MaterialStateProperty.all<EdgeInsets>(
                    EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green.shade700),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: Colors.green.shade700)))),
              onPressed: saveAppointment),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
