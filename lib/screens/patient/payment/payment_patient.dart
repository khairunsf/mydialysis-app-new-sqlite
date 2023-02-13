// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:mydialysis_app/screens/patient/payment/payment_details.dart';
import 'package:mydialysis_app/screens/patient/payment/payment_gateway.dart';
import 'package:mydialysis_app/screens/patient/widgets%20patient/2ndpart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../db/databaseHelper.dart';
import '../../../model/paymentModel.dart';
import '../widgets patient/topbar.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
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
        if (payment.bdate!.toLowerCase().contains(query.toLowerCase())) {
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
          //1st part
          TopBar(),
          //2nd part
          SecondPartPayment(),
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
                PaymentModel payment = PaymentModel.fromJson(items[i]);
                return Card(
                  margin: EdgeInsets.all(20),
                  child: ListTile(
                    tileColor: Color.fromARGB(255, 229, 241, 250),
                    contentPadding:
                        EdgeInsets.only(left: 30, top: 20, bottom: 20),
                    title: Row(
                      children: [
                        Icon(Icons.receipt_long_rounded,
                            size: 25, color: Colors.black),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Bill Detail'),
                      ],
                    ),
                    subtitle: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Icon(
                              Icons.calendar_month_outlined,
                              size: 15,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text('${payment.bdate}'),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Icon(
                              Icons.access_time_filled_outlined,
                              size: 15,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text('${payment.btime}'),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 40,
                            ),
                            Text('Dialysis Treatment  '),
                            SizedBox(
                              width: 10,
                            ),
                            Text('RM ${payment.dtprice}')
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 40,
                            ),
                            Text('Meal Charge  '),
                            SizedBox(
                              width: 48,
                            ),
                            Text('RM ${payment.mealprice}')
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 40,
                            ),
                            Text('TOTAL  '),
                            SizedBox(
                              width: 83,
                            ),
                            Text('RM ${payment.totalprice}')
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 160),
                          child: ElevatedButton(
                              child: Text("Pay Bill",
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
                                    builder: (context) => PaymentGateway(),
                                  ),
                                );
                              })),
                        )
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
