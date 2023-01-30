// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mydialysis_app/db/databaseHelper.dart';
import 'package:mydialysis_app/screens/patient/dc_directory/directoryDetails.dart';
import 'package:mydialysis_app/screens/patient/widgets%20patient/2ndpart.dart';
import 'package:mydialysis_app/screens/patient/widgets%20patient/topbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/directoryModel.dart';

class DCDirectoryPage extends StatefulWidget {
  const DCDirectoryPage({super.key});

  @override
  State<DCDirectoryPage> createState() => _DCDirectoryPageState();
}

class _DCDirectoryPageState extends State<DCDirectoryPage> {
  DatabaseHelper? _databaseHelper;
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  var allDirectory = [];
  var items = [];
  TextEditingController _search = TextEditingController();

  @override
  void initState() {
    super.initState();
    _databaseHelper = DatabaseHelper();
    _databaseHelper!.getDirectory().then((data) {
      setState(() {
        allDirectory = data;
        items = allDirectory;
      });
    });
  }

  void filterSearch(String query) async {
    var pSearchList = allDirectory;
    if (query.isNotEmpty) {
      var pListdata = [];
      pSearchList.forEach((items) {
        var directory = DirectoryModel.fromJson(items);
        if (directory.dname!.toLowerCase().contains(query.toLowerCase())) {
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
        items = allDirectory;
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
            SecondPartDirectory(),
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
                DirectoryModel directory = DirectoryModel.fromJson(items[i]);
                return Card(
                  margin: EdgeInsets.all(8),
                  child: ListTile(
                    title: Text('${directory.dname}'),
                    subtitle: Text('${directory.daddress}'),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Directorydetails(directory)));
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
