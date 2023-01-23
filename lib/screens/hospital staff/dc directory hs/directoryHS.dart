// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mydialysis_app/screens/hospital%20staff/widgets%20hs/secondpartHS.dart';
import 'package:mydialysis_app/screens/hospital%20staff/widgets%20hs/topBarHS.dart';

class HSDirectoryPage extends StatefulWidget {
  const HSDirectoryPage({super.key});

  @override
  State<HSDirectoryPage> createState() => _HSDirectoryPageState();
}

class _HSDirectoryPageState extends State<HSDirectoryPage> {
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
              SecondPartHSdirectory(),
              //3rd part
              Container(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                width: double.infinity,
                height: 900,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(193, 214, 255, 1.000),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(color: Colors.white),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('"Image"'),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              children: [
                                Text('Center name'),
                                Text('Address'),
                                Text('Phone'),
                                Text('Rating'),
                                Text('Place'),
                              ],
                            )
                          ]),
                    )
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
