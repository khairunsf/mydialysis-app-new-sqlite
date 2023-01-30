// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mydialysis_app/model/directoryModel.dart';
import 'package:mydialysis_app/screens/hospital%20staff/widgets%20hs/secondpartHS.dart';

import '../widgets hs/topBarHS.dart';

class HSDirectoryDetails extends StatelessWidget {
  DirectoryModel? directory;
  HSDirectoryDetails(this.directory, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            HSTopBar(),
            SecondPartHSViewDirectory(),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 235, 243, 249),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      //Name part
                      Row(
                        children: [
                          Text(
                            'Center Name: ',
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            width: 245,
                            height: 35,
                            child: Text(
                              '${directory!.dname}',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      //Ic part
                      Row(
                        children: [
                          Text(
                            'Address: ',
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            width: 245,
                            height: 35,
                            child: Text(
                              '${directory!.daddress}',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      //Phone number
                      Row(
                        children: [
                          Text(
                            'Contact Number: ',
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            width: 220,
                            height: 35,
                            child: Text(
                              '${directory!.dcnumber}',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      //email
                      Row(
                        children: [
                          Text(
                            'Open Time: ',
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            width: 245,
                            height: 35,
                            child: Text(
                              '${directory!.dopenhr}',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      //dob
                      Row(
                        children: [
                          Text(
                            'Close Time: ',
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            width: 245,
                            height: 35,
                            child: Text(
                              '${directory!.dclosehr}',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      //address
                      Row(
                        children: [
                          Text(
                            'Distance: ',
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            width: 245,
                            height: 35,
                            child: Text(
                              '${directory!.dkm} KM away',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      //Phone number
                      Row(
                        children: [
                          Text(
                            'Rating:    ',
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            width: 245,
                            height: 35,
                            child: Text(
                              '${directory!.drating} Stars',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 150, left: 150),
                        child: ElevatedButton(
                            child: Text("Back", style: TextStyle(fontSize: 13)),
                            style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.symmetric(
                                      horizontal: 25, vertical: 12),
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
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
