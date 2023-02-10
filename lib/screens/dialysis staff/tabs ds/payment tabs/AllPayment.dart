// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../db/databaseHelper.dart';
import '../../../../model/paymentModel.dart';

class AllPaymentTabBar extends StatefulWidget {
  const AllPaymentTabBar({super.key});

  @override
  State<AllPaymentTabBar> createState() => _AllPaymentTabBarState();
}

class _AllPaymentTabBarState extends State<AllPaymentTabBar> {
  DatabaseHelper? _databaseHelper;
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  var allPayment = [];
  var items = [];
  TextEditingController _search = TextEditingController();

  @override
  void initState() {
    super.initState();
    _databaseHelper = DatabaseHelper();
    _databaseHelper!.getPayment().then((data) {
      setState(() {
        allPayment = data;
        items = allPayment;
      });
    });
  }

  void filterSearch(String query) async {
    var pSearchList = allPayment;
    if (query.isNotEmpty) {
      var pListdata = [];
      pSearchList.forEach((items) {
        var payment = PaymentModel.fromJson(items);
        if (payment.pname!.toLowerCase().contains(query.toLowerCase())) {
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
        items = allPayment;
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
                PaymentModel _payment = PaymentModel.fromJson(items[i]);
                return Card(
                  margin: EdgeInsets.all(8),
                  child: ListTile(
                    title: Text('${_payment.pname} Record'),
                    subtitle: Row(
                      children: [
                        Text('${_payment.bdate}'),
                        SizedBox(height: 10, width: 10,),
                        Text('${_payment.btime}'),
                        SizedBox(height: 10, width: 10,),
                        Text('Total: RM${_payment.totalprice}'),
                      ],
                    ),
                    onTap: () {
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
