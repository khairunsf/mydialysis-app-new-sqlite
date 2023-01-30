// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:mydialysis_app/model/appointmentModel.dart';
import 'package:mydialysis_app/screens/hospital%20staff/appointment_hs/hsEditAppointment.dart';
import 'package:mydialysis_app/screens/hospital%20staff/appointment_hs/patientAppDetails.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../db/databaseHelper.dart';

class AllAppTabBar extends StatefulWidget {
  const AllAppTabBar({super.key});

  @override
  State<AllAppTabBar> createState() => _AllAppTabBarState();
}

class _AllAppTabBarState extends State<AllAppTabBar> {
  DatabaseHelper? _databaseHelper;
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  var allAppointment = [];
  var items = [];
  TextEditingController _search = TextEditingController();

  Future initDb() async {
    await _databaseHelper!.database;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _databaseHelper = DatabaseHelper();
    initDb();
    _databaseHelper!.getAppointment().then((data) {
      setState(() {
        allAppointment = data;
        items = allAppointment;
      });
    });
  }

  Future _refresh() async {
    setState(() {});
  }

  void filterSearch(String query) async {
    var sSearchList = allAppointment;
    if (query.isNotEmpty) {
      var sListdata = [];
      sSearchList.forEach((items) {
        var appointment = AppointmentModel.fromJson(items);
        if (appointment.pname!.toLowerCase().contains(query.toLowerCase())) {
          sListdata.add(items);
        }
      });
      setState(() {
        items = [];
        items.addAll(sListdata);
      });
    } else {
      setState(() {
        items = [];
        items = allAppointment;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refresh,
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 245, 249, 254),
        ),
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
                  hintText: 'Search Slot Time Date...',
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
                  AppointmentModel appointment =
                      AppointmentModel.fromJson(items[i]);
                  return Card(
                    margin: EdgeInsets.all(10),
                    child: ListTile(
                      tileColor: Color.fromARGB(255, 229, 241, 250),
                      contentPadding: EdgeInsets.all(10),
                      title: Row(
                        children: [
                          SizedBox(
                            width: 20,
                            height: 10,
                          ),
                          Icon(
                            color: Colors.black,
                            Icons.hourglass_empty_rounded,
                            size: 25,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '${appointment.pname}',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      subtitle: Column(
                        children: [
                          SizedBox(height: 10),
                          Row(
                            children: [
                              SizedBox(
                                width: 40,
                              ),
                              Icon(Icons.calendar_month_outlined, size: 15),
                              Text('   ${appointment.adate} '),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 40,
                              ),
                              Icon(
                                Icons.access_time_filled_outlined,
                                size: 15,
                                color: Colors.grey,
                              ),
                              Text('   ${appointment.atime}'),
                            ],
                          ),
                        ],
                      ),
                      trailing: Column(
                        children: [
                          Expanded(
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  _databaseHelper!
                                      .deleteAppointment(appointment.aid);
                                });
                              },
                              icon: Icon(
                                Icons.delete,
                                size: 25,
                                color: Colors.red[400],
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Expanded(
                            child: IconButton(
                              onPressed: (() {}),
                              icon: Icon(
                                Icons.edit,
                                color: Colors.blue[400],
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => AppDetails(appointment))));
                      },
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
