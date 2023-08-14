// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mydialysis_app/screens/dialysis%20staff/profile%20ds/profileDS.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../db/databaseHelper.dart';
import '../../../model/userModel.dart';
import '../widget ds/secondpartDS.dart';
import '../widget ds/topBarDS.dart';

class SlotTimeList extends StatefulWidget {
  const SlotTimeList({super.key});

  @override
  State<SlotTimeList> createState() => _SlotTimeListState();
}

class _SlotTimeListState extends State<SlotTimeList> {
  DatabaseHelper? _databaseHelper;
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  var allPatients = [];
  var items = [];
  TextEditingController _search = TextEditingController();

  @override
  void initState() {
    super.initState();
    _databaseHelper = DatabaseHelper();
    _databaseHelper!.getPatient().then((patient) {
      setState(() {
        allPatients = patient;
        items = allPatients;
      });
    });
  }

  void filterSearch(String query) async {
    var pSearchList = allPatients;
    if (query.isNotEmpty) {
      var pListdata = [];
      pSearchList.forEach((items) {
        var patient = UserModel.fromJson(items);
        if (patient.uname!.toLowerCase().contains(query.toLowerCase())) {
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
        items = allPatients;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //1st part
            DSTopBar(),
            //2nd part
            SecondPartDSSlotTime(),
            //3rd part
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
                UserModel patient = UserModel.fromJson(items[i]);
                return Card(
                  margin: EdgeInsets.all(8),
                  child: ListTile(
                    title: Text('${patient.uname}'), 
                    subtitle: Text('IC No: ${patient.uic}'),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DSProfilePage()));
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