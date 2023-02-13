// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, avoid_returning_null_for_void

import 'package:flutter/material.dart';
import 'package:mydialysis_app/screens/patient/appointment/reschedule_appointment.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../db/databaseHelper.dart';
import '../../../model/appointmentModel.dart';

class PatientAppTabBarUpcoming extends StatefulWidget {
  const PatientAppTabBarUpcoming({super.key});

  @override
  State<PatientAppTabBarUpcoming> createState() => _PatientAppTabBarUpcomingState();
}

class _PatientAppTabBarUpcomingState extends State<PatientAppTabBarUpcoming> {
 DatabaseHelper? _databaseHelper;
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  var upcomingApp = [];
  var items = [];
  TextEditingController _search = TextEditingController();

  @override
  void initState() {
    super.initState();
    _databaseHelper = DatabaseHelper();
    _databaseHelper!.getAppointment().then((data) {
      setState(() {
        upcomingApp = data;
        items = upcomingApp;
      });
    });
  }

  void filterSearch(String query) async {
    var pSearchList = upcomingApp;
    if (query.isNotEmpty) {
      var pListdata = [];
      pSearchList.forEach((items) {
        var nextApp = AppointmentModel.fromJson(items);
        if (nextApp.adate!.toLowerCase().contains(query.toLowerCase())) {
          pListdata.add(items);
        }
      });
      setState(() {
        items = [];
        items.addAll(pListdata);
      });
    } else {
      setState(() {
        items = [];
        items = upcomingApp;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged: ((value) {
                setState(() {
                  filterSearch(value);
                });
              }),
              controller: _search,
              decoration: InputDecoration(
                hintText: 'Search...',
                labelText: 'Search',
                isDense: true, // Added this
                contentPadding: EdgeInsets.all(8),
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25))),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, i) {
                AppointmentModel comingApp = AppointmentModel.fromJson(items[i]);
                return Card(
                  margin: EdgeInsets.all(8),
                  child: ListTile(
                    tileColor: Color.fromARGB(255, 229, 241, 250),
                    contentPadding: EdgeInsets.only(left: 30, top: 20, bottom: 20),
                    title: Text('Appointment Time'),
                    subtitle: Column(
                      children: [
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Icon(
                              Icons.badge_outlined,
                              size: 15,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text('${comingApp.drname}'),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Icon(
                              Icons.maps_home_work_outlined,
                              size: 15,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text('${comingApp.drdetail} - ${comingApp.aplace}'),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Icon(
                              Icons.calendar_month_outlined,
                              size: 15,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text('${comingApp.adate}'),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Icon(
                              Icons.access_time_filled_rounded,
                              size: 15,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text('${comingApp.atime}'),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 130),
                          child: ElevatedButton(
                              child: Text("Reschedule",
                                  style: TextStyle(fontSize: 13)),
                              style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  padding:
                                      MaterialStateProperty.all<EdgeInsets>(
                                    EdgeInsets.symmetric(
                                        horizontal: 18, vertical: 12),
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
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => AppointmentReschedule(),
                                  ),
                                );
                              })),
                        )
                      ],
                    ),
                    onTap: () {
                    },
                  ),
                );
              },
            ),
          )
        ],
        )),
    );
  }
}