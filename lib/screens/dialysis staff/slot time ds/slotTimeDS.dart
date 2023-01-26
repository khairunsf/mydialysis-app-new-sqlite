// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mydialysis_app/screens/dialysis%20staff/tabs%20ds/slot%20time%20tabs/addSlotTime.dart';
import 'package:mydialysis_app/screens/dialysis%20staff/tabs%20ds/slot%20time%20tabs/allSlotTime.dart';
import 'package:mydialysis_app/screens/dialysis%20staff/tabs%20ds/slot%20time%20tabs/requestSlotTime.dart';
import '../widget ds/secondpartDS.dart';
import '../widget ds/topBarDS.dart';

class DSSlotTimePage extends StatefulWidget {
  const DSSlotTimePage({super.key});

  @override
  State<DSSlotTimePage> createState() => _DSSlotTimePageState();
}

class _DSSlotTimePageState extends State<DSSlotTimePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SafeArea(
            child: Column(
          children: [
            //1st part
            DSTopBar(),
            //2nd part
            SecondPartDSSlotTime(),
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
                      text: 'Add Slot Time',
                    ),
                    Tab(
                      text: 'Request',
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
                  AllDSSlotTimeTabBar(),
                  AddDSSlotTimeTabBar(),
                  RequestDSSLotTimeTabBar(),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
