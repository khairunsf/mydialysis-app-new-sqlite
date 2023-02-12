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

  Future deleteData(int bid) async {
    await _databaseHelper!.deletePayment(bid);
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
                PaymentModel _payment = PaymentModel.fromJson(items[i]);
                return Card(
                  margin: EdgeInsets.all(8),
                  child: ListTile(
                    tileColor: Color.fromARGB(255, 229, 241, 250),
                    contentPadding: EdgeInsets.all(20),
                    title: Text('${_payment.pname}'),
                    subtitle: Column(
                      children: [
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_month_outlined,
                              size: 15,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text('${_payment.bdate}'),
                          ],
                        ),
                        SizedBox(height: 5,),
                        Row(
                          children: [
                            Icon(
                              Icons.access_time_filled_outlined,
                              size: 15,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text('${_payment.btime}'),
                          ],
                        ),
                        SizedBox(height: 5,),
                        Row(
                          children: [
                            Icon(
                              Icons.paid_outlined,
                              size: 15,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text('Total: RM${_payment.totalprice}'),
                          ],
                        ),
                        SizedBox(height: 5,),
                        Row(
                          children: [
                            
                            Text('Status: ${_payment.bstatus}'),
                          ],
                        ),
                      ],
                    ),
                    onTap: () {
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
                              deleteData(_payment.bid!).then((value) {
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
