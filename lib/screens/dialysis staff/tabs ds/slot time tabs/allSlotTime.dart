// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mydialysis_app/db/databaseHelper.dart';
import 'package:mydialysis_app/model/slotModel.dart';
import 'package:mydialysis_app/screens/dialysis%20staff/slot%20time%20ds/slotTimeList.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AllDSSlotTimeTabBar extends StatefulWidget {
  const AllDSSlotTimeTabBar({super.key});

  @override
  State<AllDSSlotTimeTabBar> createState() => _AllDSSlotTimeTabBarState();
}

class _AllDSSlotTimeTabBarState extends State<AllDSSlotTimeTabBar> {
  DatabaseHelper? _databaseHelper;
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  var allSlot = [];
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
    _databaseHelper!.getSlot().then((data) {
      setState(() {
        allSlot = data;
        items = allSlot;
      });
    });
  }

  Future _refresh() async{
    setState(() {});
  }

  void filterSearch(String query) async {
    var sSearchList = allSlot;
    if (query.isNotEmpty) {
      var sListdata = [];
      sSearchList.forEach((items) {
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
        items = allSlot;
      });
    }
  }

  Future deleteSlot(int sid) async {
    await _databaseHelper!.deleteSlot(sid);
    setState(() {});
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
                  SlotModel slot = SlotModel.fromJson(items[i]);
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
                            '${slot.pname}',
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
                              Text('   ${slot.sdate} '),
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
                              Text('   ${slot.stime}'),
                            ],
                          ),
                        ],
                      ),
                      trailing: Column(
                        children: [
                          Expanded(
                            child: IconButton(
                              onPressed: (() {}),
                              icon: Icon(
                                Icons.edit,
                                color: Colors.blue[400],
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Expanded(
                            child: IconButton(
                              onPressed: () {
                                  deleteSlot(slot.sid!).then((value) {
                                    setState(() {});
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
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => SlotTimeList())));
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
