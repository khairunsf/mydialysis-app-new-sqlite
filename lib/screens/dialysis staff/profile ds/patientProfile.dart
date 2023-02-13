// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables,

import 'package:flutter/material.dart';
import 'package:mydialysis_app/screens/dialysis%20staff/profile%20ds/patientsDetails.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../db/databaseHelper.dart';
import '../../../model/userModel.dart';
import '../widget ds/secondpartDS.dart';
import '../widget ds/topBarDS.dart';

class PatientProfileDS extends StatefulWidget {
  const PatientProfileDS({super.key});

  @override
  State<PatientProfileDS> createState() => _PatientProfileDSState();
}

class _PatientProfileDSState extends State<PatientProfileDS> {
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

  Future deletePatient(int uid) async {
    await _databaseHelper!.deleteUser(uid);
    setState(() {});
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
          SecondPartDSPatient(),
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
                  margin: EdgeInsets.all(20),
                  child: ListTile(
                    tileColor: Color.fromARGB(255, 229, 241, 250),
                    contentPadding:
                        EdgeInsets.only(left: 20, top: 10, bottom: 10, right: 20),
                    title: Text('${patient.uname}'),
                    subtitle: Text('IC No: ${patient.uic}'),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PatientDetailsDS(patient)));
                    },
                    trailing: Column(children: [
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
                            deletePatient(patient.uid!).then((value) {
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
                    ]),
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
