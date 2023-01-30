// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../db/databaseHelper.dart';
import '../../../model/slotModel.dart';

class PatientSTTabBarCompleted extends StatefulWidget {
  const PatientSTTabBarCompleted({super.key});

  @override
  State<PatientSTTabBarCompleted> createState() => _PatientSTTabBarCompletedState();
}

class _PatientSTTabBarCompletedState extends State<PatientSTTabBarCompleted> {
  DatabaseHelper? _databaseHelper;
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  var completedSlot = [];
  var items = [];
  TextEditingController _search = TextEditingController();

  @override
  void initState() {
    super.initState();
    _databaseHelper = DatabaseHelper();
    _databaseHelper!.getCompleteSlot().then((data) {
      setState(() {
        completedSlot = data;
        items = completedSlot;
      });
    });
  }

  void filterSearch(String query) async {
    var pSearchList = completedSlot;
    if (query.isNotEmpty) {
      var pListdata = [];
      pSearchList.forEach((items) {
        var doneSlot = SlotModel.fromJson(items);
        if (doneSlot.sdate!.toLowerCase().contains(query.toLowerCase())) {
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
        items = completedSlot;
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
                    title: Text('Completed Slot Treatment'),
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