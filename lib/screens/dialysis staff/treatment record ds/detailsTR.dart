import 'package:flutter/material.dart';
import 'package:mydialysis_app/screens/dialysis%20staff/widget%20ds/secondpartDS.dart';
import 'package:mydialysis_app/screens/dialysis%20staff/widget%20ds/topBarDS.dart';

class DSTreatmentRecordDetails extends StatefulWidget {
  const DSTreatmentRecordDetails({super.key});

  @override
  State<DSTreatmentRecordDetails> createState() => _DSTreatmentRecordDetailsState();
}

class _DSTreatmentRecordDetailsState extends State<DSTreatmentRecordDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              //1st part
              DSTopBar(),
              //2nd part
              SecondPartDSTreatmentRecord(),
              //3rd part
              Container(
                padding: EdgeInsets.only(top: 15, bottom: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 245, 249, 254),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        Icon(
                          Icons.folder_open_outlined,
                          size: 25,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Patient Name',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(right: 140),
                      child: Text(
                        '[Saturday, 30 April]',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    //1st box (Before dialysis)
                    Container(
                      padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
                      width: 350,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(104, 148, 189, 0.7),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Before Dialysis',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: Text(
                              'Body Weight : ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: Text(
                              'Blood Pressure : ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    //2nd box (during dialysis)
                    Container(
                      padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
                      width: 350,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(162, 104, 189, 0.7),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'During Dialysis',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: Text(
                              'Blood Pressure per hour',
                              style: TextStyle(color: Colors.white,
                              fontSize: 12),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: Text(
                              '1  :  ',
                              style: TextStyle(color: Colors.white,
                              fontSize: 12,),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    //3rd box (After dialysis)
                    Container(
                      padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
                      width: 350,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(189,104,104,0.8),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Before Dialysis',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: Text(
                              'Body Weight : ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: Text(
                              'Blood Pressure : ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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