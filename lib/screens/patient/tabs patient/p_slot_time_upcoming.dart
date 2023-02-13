// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mydialysis_app/screens/patient/time%20slot/request_slotTime.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../db/databaseHelper.dart';
import '../../../model/slotModel.dart';

class PatientSTTabBarUpcoming extends StatefulWidget {
  const PatientSTTabBarUpcoming({super.key});

  @override
  State<PatientSTTabBarUpcoming> createState() =>
      _PatientSTTabBarUpcomingState();
}

class _PatientSTTabBarUpcomingState extends State<PatientSTTabBarUpcoming> {
  DatabaseHelper? _databaseHelper;
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  var upcomingSlot = [];
  var items = [];
  TextEditingController _search = TextEditingController();

  @override
  void initState() {
    super.initState();
    _databaseHelper = DatabaseHelper();
    _databaseHelper!.getSlot().then((data) {
      setState(() {
        upcomingSlot = data;
        items = upcomingSlot;
      });
    });
  }

  void filterSearch(String query) async {
    var pSearchList = upcomingSlot;
    if (query.isNotEmpty) {
      var pListdata = [];
      pSearchList.forEach((items) {
        var nextSlot = SlotModel.fromJson(items);
        if (nextSlot.sdate!.toLowerCase().contains(query.toLowerCase())) {
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
        items = upcomingSlot;
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
                SlotModel comingSlot = SlotModel.fromJson(items[i]);
                return Card(
                  margin: EdgeInsets.all(8),
                  child: ListTile(
                    tileColor: Color.fromARGB(255, 229, 241, 250),
                    contentPadding: EdgeInsets.only(left: 30, top: 20, bottom: 20),
                    title: Row(
                      children: [
                        Icon(Icons.hourglass_empty_rounded,
                            size: 25, color: Colors.black),
                        SizedBox(
                          width: 5,
                        ),
                        Text('This Week Slot Time'),
                      ],
                    ),
                    subtitle: Column(
                      children: [
                        SizedBox(height: 10,),
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
                            Text('${comingSlot.sdate}'),
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
                              Icons.access_time_filled_outlined,
                              size: 15,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text('${comingSlot.stime}'),
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
                              child: Text("Request Slot Time",
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
                                    builder: (context) => SlotTimeRequest(),
                                  ),
                                );
                              })),
                        )
                      ],
                    ),
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
