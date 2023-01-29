// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mydialysis_app/screens/dialysis%20staff/profile%20ds/profileDS.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../db/databaseHelper.dart';
import '../../../model/slotModel.dart';
import '../../../model/userModel.dart';
import '../widget ds/secondpartDS.dart';
import '../widget ds/topBarDS.dart';

class SlotTimeList extends StatefulWidget {
  const SlotTimeList({super.key});

  @override
  State<SlotTimeList> createState() => _SlotTimeListState();
}

class _SlotTimeListState extends State<SlotTimeList> {
  DateFormat dateFormat = DateFormat("dd-MM-yyyy");
  TextEditingController stDateController = TextEditingController();
  TextEditingController stTimeController = TextEditingController();
  TextEditingController stReasonController = TextEditingController();
  DatabaseHelper? _databaseHelper;
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  var allSlotTime = [];
  var items = [];
  TextEditingController _search = TextEditingController();

  @override
  void initState() {
    super.initState();
    _databaseHelper = DatabaseHelper();
    _databaseHelper!.getAllSlot().then((slot) {
      setState(() {
        allSlotTime = slot;
        items = allSlotTime;
      });
    });
  }

  void filterSearch(String query) async {
    var pSearchList = allSlotTime;
    if (query.isNotEmpty) {
      var sListdata = [];
      pSearchList.forEach((items) {
        var slot = SlotModel.fromJson(items);
        if (slot.sdate!.toLowerCase().contains(query.toLowerCase())) {
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
        items = allSlotTime;
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
            SecondPartDSST(),
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