// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:mydialysis_app/db/databaseHelper.dart';
import 'package:mydialysis_app/screens/patient/profile/edit_profile.dart';
import 'package:mydialysis_app/testingFetch.dart';
import 'package:mydialysis_app/screens/patient/treatment%20record/tr_details.dart';
import 'package:mydialysis_app/screens/patient/widgets%20patient/2ndpart.dart';
import 'package:mydialysis_app/screens/patient/widgets%20patient/topbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/treatmentModel.dart';
import 'trDetailsNew.dart';

class TreatmentRecordPage extends StatefulWidget {
  const TreatmentRecordPage({super.key});

  @override
  State<TreatmentRecordPage> createState() => _TreatmentRecordPageState();
}

class _TreatmentRecordPageState extends State<TreatmentRecordPage> {
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
        if (treatment.trdate!.toLowerCase().contains(query.toLowerCase())) {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //1st part
            TopBar(),
            //2nd part
            SecondPartTreatment(),
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
                TreatmentModel treatment = TreatmentModel.fromJson(items[i]);
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
                        Text('${treatment.pname} Record'),
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
                              Text('   ${treatment.trdate} '),
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
                              Text('   ${treatment.trtime}'),
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
                                    builder: (context) => TrDetails(treatment),
                                  ),
                                );
                              }),),),
                        ],
                      ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => TrDetails(treatment)));
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
