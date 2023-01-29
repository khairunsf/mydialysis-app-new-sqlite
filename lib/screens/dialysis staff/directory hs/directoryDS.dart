// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mydialysis_app/screens/dialysis%20staff/tabs%20ds/directory%20tabs/AddDirectory.dart';
import 'package:mydialysis_app/screens/dialysis%20staff/tabs%20ds/directory%20tabs/AllDirectory.dart';
import 'package:mydialysis_app/screens/dialysis%20staff/widget%20ds/secondpartDS.dart';

import '../widget ds/topBarDS.dart';

class DSDirectoryPage extends StatefulWidget {
  const DSDirectoryPage({super.key});

  @override
  State<DSDirectoryPage> createState() => _DSDirectoryPageState();
}

class _DSDirectoryPageState extends State<DSDirectoryPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
            child: Column(
          children: [
            //1st part
            DSTopBar(),
            //2nd part
            SecondPartDSDirectory(),
            //3rd part + tab bar
            Container(
              width: 380,
              padding: EdgeInsets.only(
                top: 10,
                bottom: 10,
              ),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(
                  7,
                ),
              ),
              child: Center(
                child: TabBar(
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.grey.shade400,
                  isScrollable: true,
                  labelPadding: EdgeInsets.only(
                      left: 30, right: 30, bottom: 0.2, top: 0.2),
                  indicator: BoxDecoration(
                    border: Border.all(color: Colors.green.shade700),
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.green.shade700,
                  ),
                  tabs: [
                    Tab(
                      text: '    All    ',
                    ),
                    Tab(
                      text: 'Add Directory',
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: TabBarView(
                children: [
                  AllDirectoryTabBar(),
                  AddDirectoryTabBar(),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}