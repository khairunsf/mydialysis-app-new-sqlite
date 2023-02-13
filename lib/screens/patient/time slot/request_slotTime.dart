// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, depend_on_referenced_packages, camel_case_types, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:mydialysis_app/screens/patient/time%20slot/time_slot_patient.dart';
import 'package:mydialysis_app/screens/patient/widgets%20patient/2ndpart.dart';
import 'package:mydialysis_app/screens/patient/widgets%20patient/topbar.dart';
import 'package:intl/intl.dart';

class SlotTimeRequest extends StatefulWidget {
  const SlotTimeRequest({super.key});

  @override
  State<SlotTimeRequest> createState() => _SlotTimeRequestState();
}

class _SlotTimeRequestState extends State<SlotTimeRequest> {
  DateFormat dateFormat = DateFormat("dd-MM-yyyy");
  TextEditingController stDateController = TextEditingController();
  TextEditingController stTimeController = TextEditingController();
  TextEditingController stReasonController = TextEditingController();

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
            SecondPartSlotTimeRequest(),
            //3rd part
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),

                Text(
                  'Request Slot Time Form',
                  style: TextStyle(fontSize: 18),
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
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blueGrey[50],
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: stDateController,
                        decoration: InputDecoration(
                          icon: Icon(Icons.calendar_month_outlined),
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
                              stDateController.text =
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
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blueGrey[50],
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: stTimeController,
                        decoration: InputDecoration(
                          icon: Icon(Icons.access_time),
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
                              stTimeController.text =
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

                //Reason textfield
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Reason',
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
                        controller: stReasonController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'What is your reason?',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                //text
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                      'Please noted that your request will only be approved if there is any slot availability. Thank you.'),
                ),
                SizedBox(
                  height: 25,
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
                    onPressed: () {
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Request Sent Successfully'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => TimeSlotPage()),
                              ),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    })
              ],
            )
          ],
        ),
      )),
    );
  }
}
