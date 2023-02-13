// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../db/databaseHelper.dart';
import '../../../../model/directoryModel.dart';
import '../../directory ds/directoryDetailsDS.dart';

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

  Future deleteData(int did) async {
    await _databaseHelper!.deleteDirectory(did);
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
                DirectoryModel directory = DirectoryModel.fromJson(items[i]);
                return Card(
                  margin: EdgeInsets.all(10),
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
                          builder: (context) =>
                              DirectoryDetailsDS(directory)));
                    },
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
                              deleteData(directory.did!).then((value) {
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
                      ],
                    ),
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
