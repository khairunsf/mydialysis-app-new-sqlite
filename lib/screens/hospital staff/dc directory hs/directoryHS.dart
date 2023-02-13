// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mydialysis_app/screens/hospital%20staff/dc%20directory%20hs/directoryDetails.dart';
import 'package:mydialysis_app/screens/hospital%20staff/widgets%20hs/secondpartHS.dart';
import 'package:mydialysis_app/screens/hospital%20staff/widgets%20hs/topBarHS.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../db/databaseHelper.dart';
import '../../../model/directoryModel.dart';

class HSDirectoryPage extends StatefulWidget {
  const HSDirectoryPage({super.key});

  @override
  State<HSDirectoryPage> createState() => _HSDirectoryPageState();
}

class _HSDirectoryPageState extends State<HSDirectoryPage> {
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
            HSTopBar(),
            //2nd part
            SecondPartHSdirectory(),
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
                    tileColor: Color.fromARGB(255, 229, 241, 250),
                    contentPadding: EdgeInsets.all(20),
                    title: Text('${directory.dname}'),
                    subtitle: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.home,
                              size: 15,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text('${directory.daddress}'),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.call,
                              size: 15,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text('${directory.dcnumber}'),
                          ],
                        )
                      ],
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => HSDirectoryDetails(directory)));
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
