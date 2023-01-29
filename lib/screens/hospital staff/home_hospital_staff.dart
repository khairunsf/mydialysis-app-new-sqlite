// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mydialysis_app/screens/hospital%20staff/appointment_hs/appointmentPageHS.dart';
import 'package:mydialysis_app/screens/hospital%20staff/dc%20directory%20hs/directoryHS.dart';
import 'package:mydialysis_app/screens/hospital%20staff/profile%20hs/patientProfileHS.dart';
import 'package:mydialysis_app/screens/hospital%20staff/widgets%20hs/topBarHS.dart';

import '../patient/dc_directory/dc_directory.dart';

class HSHomePage extends StatefulWidget {
  const HSHomePage({super.key});

  @override
  State<HSHomePage> createState() => _HSHomePageState();
}

class _HSHomePageState extends State<HSHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              //1st part
              HSTopBar(),
              //2nd part
              SizedBox(height: 40,),
              Container(
                padding:
                    EdgeInsets.symmetric(vertical: 50),
                decoration: BoxDecoration(color: Colors.white60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //box 1
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) => HSDirectoryPage()),
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
                              'Dialysis Center Directory',
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
                              builder: (context) => HSPatientProfilePage()),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(25.0),
                        width: 150,
                        height: 120,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(192, 240, 255, 1.000),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Align(
                                alignment: Alignment.topLeft,
                                child: Icon(Icons.folder_open)),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Patient Profile',
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
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (context) => HSAppointmentPage()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(25.0),
                  width: 150,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255,197,193,50),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.topLeft,
                          child: Icon(Icons.folder_open)),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Patient Appointment',
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
