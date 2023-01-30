// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mydialysis_app/model/treatmentModel.dart';

import '../widgets patient/2ndpart.dart';
import '../widgets patient/topbar.dart';

class TrDetails extends StatelessWidget {
  TreatmentModel? treatment;
  TrDetails(this.treatment,{super.key});

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
              SecondPartTreatment(),
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
                          '${treatment!.trdate}',
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
                        '${treatment!.trtime}',
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
                              'Body Weight : ${treatment!.bbweight} Kg',
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
                              'Blood Pressure : ${treatment!.bbpreasure} mmHg',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: Text(
                              'Heart Rate : ${treatment!.bhrate} bpm',
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
                              'Body Temperature : ${treatment!.btemp} celsius',
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
                              '1  :  ${treatment!.dbpreasure1}',
                              style: TextStyle(color: Colors.white,
                              fontSize: 12,),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: Text(
                              '2  :  ${treatment!.dbpreasure2}',
                              style: TextStyle(color: Colors.white,
                              fontSize: 12,),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: Text(
                              '3  :  ${treatment!.dbpreasure3}',
                              style: TextStyle(color: Colors.white,
                              fontSize: 12,),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: Text(
                              '4  :  ${treatment!.dbpreasure4}',
                              style: TextStyle(color: Colors.white,
                              fontSize: 12,),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: Text(
                              'Heart Rate per hour',
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
                              '1  :  ${treatment!.dhrate1}',
                              style: TextStyle(color: Colors.white,
                              fontSize: 12,),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: Text(
                              '2  : ${treatment!.dhrate2}',
                              style: TextStyle(color: Colors.white,
                              fontSize: 12,),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: Text(
                              '3  :  ${treatment!.dhrate3}',
                              style: TextStyle(color: Colors.white,
                              fontSize: 12,),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: Text(
                              '4  :  ${treatment!.dhrate4}',
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
                            'After Dialysis',
                            // ignore: prefer_const_constructors
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
                              'Body Weight : ${treatment!.abweight} Kg',
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
                              'Blood Pressure : ${treatment!.abpreasure} mmHg',
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
                              'Heart Rate : ${treatment!.ahrate} bpm',
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
                              'Body Temperature : ${treatment!.atemp} celsius',
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
