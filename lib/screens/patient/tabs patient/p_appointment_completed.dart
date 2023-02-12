// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:mydialysis_app/screens/patient/appointment/details_appointment.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../db/databaseHelper.dart';
import '../../../model/appointmentModel.dart';

class PatientAppTabBarCompleted extends StatefulWidget {
  const PatientAppTabBarCompleted({super.key});

  @override
  State<PatientAppTabBarCompleted> createState() => _PatientAppTabBarCompletedState();
}

class _PatientAppTabBarCompletedState extends State<PatientAppTabBarCompleted> {
   DatabaseHelper? _databaseHelper;
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  var completedApp = [];
  var items = [];
  TextEditingController _search = TextEditingController();

  @override
  void initState() {
    super.initState();
    _databaseHelper = DatabaseHelper();
    _databaseHelper!.getAppointment().then((data) {
      setState(() {
        completedApp = data;
        items = completedApp;
      });
    });
  }

  void filterSearch(String query) async {
    var pSearchList = completedApp;
    if (query.isNotEmpty) {
      var pListdata = [];
      pSearchList.forEach((items) {
        var doneApp = AppointmentModel.fromJson(items);
        if (doneApp.adate!.toLowerCase().contains(query.toLowerCase())) {
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
        items = completedApp;
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
                AppointmentModel completeApp = AppointmentModel.fromJson(items[i]);
                return Card(
                  margin: EdgeInsets.all(8),
                  child: ListTile(
                    title: Text('Completed Appointment Time'),
                    subtitle: Row(
                      children: [
                        Text('${completeApp.adate}'),
                        SizedBox(height: 10,width: 10,),
                        Text('${completeApp.atime}'),
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