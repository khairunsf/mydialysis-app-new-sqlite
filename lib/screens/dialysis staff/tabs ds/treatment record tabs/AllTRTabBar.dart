// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../db/databaseHelper.dart';
import '../../../../model/treatmentModel.dart';
import '../../treatment record ds/detailsTR.dart';

class AllDSTreatmentRecordTabBar extends StatefulWidget {
  const AllDSTreatmentRecordTabBar({super.key});

  @override
  State<AllDSTreatmentRecordTabBar> createState() =>
      _AllDSTreatmentRecordTabBarState();
}

class _AllDSTreatmentRecordTabBarState
    extends State<AllDSTreatmentRecordTabBar> {
DatabaseHelper? _databaseHelper;
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  var allTreatment = [];
  var items = [];
  TextEditingController _search = TextEditingController();

  @override
  void initState() {
    super.initState();
    _databaseHelper = DatabaseHelper();
    _databaseHelper!.getTreatment().then((data) {
      setState(() {
        allTreatment = data;
        items = allTreatment;
      });
    });
  }

  void filterSearch(String query) async {
    var pSearchList = allTreatment;
    if (query.isNotEmpty) {
      var pListdata = [];
      pSearchList.forEach((items) {
        var treatment = TreatmentModel.fromJson(items);
        if (treatment.pname!.toLowerCase().contains(query.toLowerCase())) {
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
        items = allTreatment;
      });
    }
  }
  Future deleteData(int trid) async {
    await _databaseHelper!.deleteData(trid);
    setState(() {});
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
                TreatmentModel tr = TreatmentModel.fromJson(items[i]);
                return Card(
                  margin: EdgeInsets.all(8),
                  child: ListTile(
                    tileColor: Color.fromARGB(255, 229, 241, 250),
                    contentPadding:
                        EdgeInsets.only(left: 20, top: 10, bottom: 10, right: 20),
                    title: Row(
                      children: [
                        SizedBox(
                            width: 20,
                            height: 10,
                          ),
                          Icon(
                            color: Colors.black,
                            Icons.folder_open_rounded,
                            size: 25,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        Text('${tr.pname} Record'),
                      ],
                    ),
                    subtitle: 
                    Column(
                        children: [
                          SizedBox(height: 10),
                          Row(
                            children: [
                              SizedBox(
                                width: 40,
                              ),
                              Icon(Icons.calendar_month_outlined, size: 15),
                              Text('   ${tr.trdate} '),
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
                              Text('   ${tr.trtime}'),
                            ],
                          ),
                          Padding(
                          padding: const EdgeInsets.only(left: 160),
                          child: ElevatedButton(
                              child: Text("View Details",
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
                                    builder: (context) => DSTreatmentRecordDetails(tr),
                                  ),
                                );
                              }),),),
                        ],
                      ),
                      trailing: Column(
                      children: [
                        Expanded(
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.edit,
                              color: Colors.blue[400],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: IconButton(
                            onPressed: (() {
                              deleteData(tr.trid!).then((value) {
                                setState(() {});
                              });
                            }),
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red[400],
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                      ]),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DSTreatmentRecordDetails(tr)));
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
