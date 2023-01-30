// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
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
    _databaseHelper!.getUpcomingSlot().then((data) {
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
                    title: Text('This Week Slot Time'),
                    subtitle: Row(
                      children: [
                        Text('${comingSlot.sdate}'),
                        SizedBox(height: 10),
                        Text('${comingSlot.stime}'),
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
