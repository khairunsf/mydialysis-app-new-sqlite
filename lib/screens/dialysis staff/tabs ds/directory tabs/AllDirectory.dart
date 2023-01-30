// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../db/databaseHelper.dart';
import '../../../../model/directoryModel.dart';
import '../../directory hs/directoryDetailsDS.dart';

class AllDirectoryTabBar extends StatefulWidget {
  const AllDirectoryTabBar({super.key});

  @override
  State<AllDirectoryTabBar> createState() => _AllDirectoryTabBarState();
}

class _AllDirectoryTabBarState extends State<AllDirectoryTabBar> {
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
                    subtitle: Row(
                      children: [
                        Text('${directory.daddress}'),
                        SizedBox(height: 10),
                        Text('${directory.dcnumber}'),
                      ],
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DirectoryDetailsDS(directory)));
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
