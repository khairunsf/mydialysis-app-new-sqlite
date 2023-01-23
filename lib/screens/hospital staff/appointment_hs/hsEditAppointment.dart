// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mydialysis_app/screens/hospital%20staff/widgets%20hs/secondpartHS.dart';
import 'package:mydialysis_app/screens/hospital%20staff/widgets%20hs/topBarHS.dart';
import 'package:mydialysis_app/screens/patient/widgets%20patient/topbar.dart';
import 'package:intl/intl.dart';

class HsEditAppointmentPage extends StatefulWidget {
  const HsEditAppointmentPage({super.key});

  @override
  State<HsEditAppointmentPage> createState() => _HsEditAppointmentPageState();
}

class _HsEditAppointmentPageState extends State<HsEditAppointmentPage> {
  //text controllers
  final placeController = TextEditingController();
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  final pNameController = TextEditingController();
  final drNameController = TextEditingController();
  DateFormat dateFormat = DateFormat("dd-MM-yyyy");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            HSTopBar(),
            SecondPartHSeditAppointment(),
            //content
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                //Name textfield
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.account_box_outlined,
                        color: Colors.grey.shade700,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Patient Name',
                        style: TextStyle(
                          color: Colors.grey[800],
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
                        controller: pNameController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter Name',
                        ),
                      ),
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
                      Icon(
                        Icons.home_work_outlined,
                        color: Colors.grey.shade700,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Place',
                        style: TextStyle(
                          color: Colors.grey[800],
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
                        controller: placeController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter Place',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),

                //date
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.calendar_month_outlined,
                        color: Colors.grey.shade700,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Date',
                        style: TextStyle(
                          color: Colors.grey[800],
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
                        controller: dateController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
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
                              dateController.text =
                                  dateFormat.format(pickeddate);
                            });
                          }
                        }),
                      ),
                    ),
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
                      Icon(
                        Icons.access_time,
                        color: Colors.grey.shade700,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Time',
                        style: TextStyle(
                          color: Colors.grey[800],
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
                        controller: timeController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Select Time',
                        ),
                        onTap: (() async {
                          TimeOfDay? pickedtime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          if (pickedtime != null) {
                            setState(() {
                              timeController.text =
                                  pickedtime.format(context).toString();
                            });
                          }
                        }),
                      ),
                    ),
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
                      Icon(
                        Icons.assignment_ind_outlined,
                        color: Colors.grey.shade700,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Doctor Name',
                        style: TextStyle(
                          color: Colors.grey[800],
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
                        controller: drNameController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter Name',
                        ),
                      ),
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
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.green.shade700),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: BorderSide(
                                        color: Colors.green.shade700)))),
                    onPressed: () {}),
                SizedBox(
                  height: 20,
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
