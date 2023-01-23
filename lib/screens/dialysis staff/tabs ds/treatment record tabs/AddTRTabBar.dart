import 'package:flutter/material.dart';

class AddDSTreatmentRecordTabBar extends StatefulWidget {
  const AddDSTreatmentRecordTabBar({super.key});

  @override
  State<AddDSTreatmentRecordTabBar> createState() => _AddDSTreatmentRecordTabBarState();
}

class _AddDSTreatmentRecordTabBarState extends State<AddDSTreatmentRecordTabBar> {
  TextEditingController stReasonController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          //content
          Column(
            children: [
              SizedBox(
                height: 10,
              ),

              Text(
                'Treatment Data Form',
                style: TextStyle(fontSize: 18),
              ),

              SizedBox(
                height: 15,
              ),

              //Name textfield
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Patient Name',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[50],
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: stReasonController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Name',
                      ),
                    ),
                  ),
                ),
              ),
            SizedBox(
                height: 10,
              ),
              
            Text(
                'Before Dialysis',
                style: TextStyle(fontSize: 16),
              ),

              SizedBox(
                height: 10,
              ),
              //BW textfield
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Body Weight',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[50],
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: stReasonController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Body Weight',
                      ),
                    ),
                  ),
                ),
              ),
            SizedBox(
                height: 10,
              ),

              //BP textfield
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Blood Pressure',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[50],
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: stReasonController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Blood Pressure',
                      ),
                    ),
                  ),
                ),
              ),
            SizedBox(
                height: 10,
              ),
              Text(
                'After Dialysis',
                style: TextStyle(fontSize: 16),
              ),

              SizedBox(
                height: 10,
              ),
              //BW textfield
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Body Weight',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[50],
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: stReasonController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Body Weight',
                      ),
                    ),
                  ),
                ),
              ),
            SizedBox(
                height: 10,
              ),

              //BP textfield
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Blood Pressure',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[50],
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: stReasonController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Blood Pressure',
                      ),
                    ),
                  ),
                ),
              ),
            SizedBox(
                height: 15,
              ),
              
              //button
              ElevatedButton(
                  child: Text("Submit", style: TextStyle(fontSize: 16)),
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.green.shade700),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(color: Colors.green.shade700)))),
                  onPressed: () {}),
                  SizedBox(height: 10,),
            ],
          )
        ],
      ),
    );
  }
}