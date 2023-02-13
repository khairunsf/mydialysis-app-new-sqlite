// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:mydialysis_app/model/paymentModel.dart';
import 'package:mydialysis_app/screens/patient/payment/payment_gateway.dart';
import 'package:mydialysis_app/screens/patient/widgets%20patient/2ndpart.dart';
import '../widgets patient/topbar.dart';

class PaymentDetails extends StatelessWidget {
  PaymentModel? payment;
  PaymentDetails(this.payment, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              //1st part
              TopBar(),
              //2nd part
              SecondPartGateway(),
              //3rd part
              Container(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 235, 243, 249),
                ),
                child: Column(
                  children: [
                    //1ST ROW
                    Row(
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        Icon(Icons.receipt_long_rounded,
                            size: 25, color: Colors.black),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Bill Detail',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    //2ND ROW
                    Table(
                      children: [
                        TableRow(children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 45,
                                height: 30,
                              ),
                              Icon(
                                Icons.calendar_month_outlined,
                                size: 15,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Date: ${payment!.bdate}',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ]), //3RD ROW
                        TableRow(children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 45,
                                height: 30,
                              ),
                              Icon(
                                Icons.access_time_filled_rounded,
                                size: 15,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Time: ${payment!.btime}',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ]),
                        //4TH ROW
                        TableRow(children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 65,
                                height: 30,
                              ),
                              Text(
                                'Dialysis Treatment: RM${payment!.dtprice}',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ]),
                        //5TH ROW
                        TableRow(children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 65,
                                height: 30,
                              ),
                              Text(
                                'Meal Charge:RM${payment!.mealprice}',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ]),
                        //6TH ROW
                        TableRow(children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 65,
                                height: 30,
                              ),
                              Text(
                                'Total: RM${payment!.totalprice}',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ]),
                        //BUTTON
                        TableRow(children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 45,
                                height: 100,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 120),
                                child: ElevatedButton(
                                    child: Text("Pay Bill",
                                        style: TextStyle(fontSize: 13)),
                                    style: ButtonStyle(
                                        foregroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.white),
                                        padding: MaterialStateProperty.all<
                                            EdgeInsets>(
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
                                          builder: (context) =>
                                              PaymentGateway(),
                                        ),
                                      );
                                    })),
                              )
                            ],
                          ),
                        ]),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
