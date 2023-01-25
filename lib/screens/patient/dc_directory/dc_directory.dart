// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mydialysis_app/db/databaseHelper.dart';
import 'package:mydialysis_app/screens/patient/widgets%20patient/2ndpart.dart';
import 'package:mydialysis_app/screens/patient/widgets%20patient/topbar.dart';

class DCDirectoryPage extends StatefulWidget {
  const DCDirectoryPage({super.key});

  @override
  State<DCDirectoryPage> createState() => _DCDirectoryPageState();
}

class _DCDirectoryPageState extends State<DCDirectoryPage> {
  DatabaseHelper? _databaseHelper;

  Future initDb() async {
    await _databaseHelper!.database;
    setState(() {});
  }

  @override
  void initState() {
    _databaseHelper = DatabaseHelper();
    initDb();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
            //1st Part
            TopBar(),
            //2nd Part
            SecondPartDirectory(),
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
                      SizedBox(width: 20,),
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
          ]),
        ),
      ),
    );
  }
}
