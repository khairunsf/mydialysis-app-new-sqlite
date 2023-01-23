import 'package:flutter/material.dart';
import 'package:mydialysis_app/screens/dialysis%20staff/tabs%20ds/treatment%20record%20tabs/AddTRTabBar.dart';
import 'package:mydialysis_app/screens/dialysis%20staff/tabs%20ds/treatment%20record%20tabs/AllTRTabBar.dart';
import 'package:mydialysis_app/screens/dialysis%20staff/widget%20ds/secondpartDS.dart';

import '../widget ds/topBarDS.dart';

class DSTreatmentRecordPage extends StatefulWidget {
  const DSTreatmentRecordPage({super.key});

  @override
  State<DSTreatmentRecordPage> createState() => _DSTreatmentRecordPageState();
}

class _DSTreatmentRecordPageState extends State<DSTreatmentRecordPage> {
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
            SecondPartDSTreatmentRecord(),
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
                      text: 'Add Treatment Record',
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
                  AllDSTreatmentRecordTabBar(),
                  AddDSTreatmentRecordTabBar(),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}