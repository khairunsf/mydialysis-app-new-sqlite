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
                    title: Text('${tr.pname} Record'),
                    subtitle: Row(
                      children: [
                        Text('${tr.trdate}'),
                        SizedBox(height: 10),
                        Text('${tr.trtime}'),
                      ],
                    ),
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
