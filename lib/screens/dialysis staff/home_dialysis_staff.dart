// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mydialysis_app/screens/dialysis%20staff/directory%20hs/directoryDS.dart';
import 'package:mydialysis_app/screens/dialysis%20staff/payment%20ds/paymentDS.dart';
import 'package:mydialysis_app/screens/dialysis%20staff/profile%20ds/patientProfile.dart';
import 'package:mydialysis_app/screens/dialysis%20staff/slot%20time%20ds/slotTimeDS.dart';
import 'package:mydialysis_app/screens/dialysis%20staff/treatment%20record%20ds/treatmentRecordDS.dart';
import 'package:mydialysis_app/screens/dialysis%20staff/widget%20ds/topBarDS.dart';

class DSHomePage extends StatefulWidget {
  const DSHomePage({super.key});

  @override
  State<DSHomePage> createState() => _DSHomePageState();
}

class _DSHomePageState extends State<DSHomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              //TopBar
              DSTopBar(),
              //2nd part
              SizedBox(
                height: 40,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 50),
                decoration: BoxDecoration(color: Colors.white60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //box 1
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) => PatientProfileDS()),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(25.0),
                        width: 150,
                        height: 120,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(192,240,255,1.000),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Icon(
                                Icons.folder_open,
                                size: 23,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Patients',
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                    ),
        
                    //box 2
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) => DSSlotTimePage()),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(25.0),
                        width: 150,
                        height: 120,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(239,193,255,1.000),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Align(
                                alignment: Alignment.topLeft,
                                child: Icon(Icons.timer_outlined)),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Patient Slot Time',
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //box 3
              Container(
                decoration: BoxDecoration(color: Colors.white60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //box 3
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) => DSDirectoryPage()),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(25.0),
                        width: 150,
                        height: 120,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(193, 214, 255, 1.000),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Icon(
                                Icons.menu_book_outlined,
                                size: 23,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Dialysis Center Directory ',
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                    ),
        
                    //box 4
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) => DSPaymentPage()),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(25.0),
                        width: 150,
                        height: 120,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(255,216,193,1.000),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Align(
                                alignment: Alignment.topLeft,
                                child: Icon(Icons.paid_outlined)),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Patient Payment',
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
