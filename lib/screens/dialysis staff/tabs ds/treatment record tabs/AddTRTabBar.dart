// ignore_for_file: prefer_const_constructors, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:mydialysis_app/model/treatmentModel.dart';
import 'package:mydialysis_app/screens/dialysis%20staff/treatment%20record%20ds/treatmentRecordDS.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:intl/intl.dart';
import '../../../../db/databaseHelper.dart';

class AddDSTreatmentRecordTabBar extends StatefulWidget {
  const AddDSTreatmentRecordTabBar({super.key});

  @override
  State<AddDSTreatmentRecordTabBar> createState() =>
      _AddDSTreatmentRecordTabBarState();
}

class _AddDSTreatmentRecordTabBarState
    extends State<AddDSTreatmentRecordTabBar> {
  DatabaseHelper? _databaseHelper;
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  final _formKey = new GlobalKey<FormState>();

  TextEditingController _pnameCon = TextEditingController();
  TextEditingController _trdateCon = TextEditingController();
  TextEditingController _trtimeCon = TextEditingController();
  TextEditingController _bbwCon = TextEditingController();
  TextEditingController _bbpCon = TextEditingController();
  TextEditingController _bhrCon = TextEditingController();
  TextEditingController _btempCon = TextEditingController();
  TextEditingController _dbp1Con = TextEditingController();
  TextEditingController _dbp2Con = TextEditingController();
  TextEditingController _dbp3Con = TextEditingController();
  TextEditingController _dbp4Con = TextEditingController();
  TextEditingController _dbp5Con = TextEditingController();
  TextEditingController _dhr1Con = TextEditingController();
  TextEditingController _dhr2Con = TextEditingController();
  TextEditingController _dhr3Con = TextEditingController();
  TextEditingController _dhr4Con = TextEditingController();
  TextEditingController _dhr5Con = TextEditingController();
  TextEditingController _abwCon = TextEditingController();
  TextEditingController _abpCon = TextEditingController();
  TextEditingController _ahrCon = TextEditingController();
  TextEditingController _atempCon = TextEditingController();
  DateFormat dateFormat = DateFormat("dd-MM-yyyy");

  Future initDb() async {
    await _databaseHelper!.database;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _databaseHelper = DatabaseHelper();
    initDb();
  }

  Future<TreatmentModel?> addTreatmeant() async {
    await _databaseHelper!.insertData({
      'bbweight': _bbwCon.text.trim(),
      'bbpreasure': _bbpCon.text.trim(),
      'bhrate': _bhrCon.text.trim(),
      'btemp': _btempCon.text.trim(),
      'dbpreasure1': _dbp1Con.text.trim(),
      'dbpreasure2': _dbp2Con.text.trim(),
      'dbpreasure3': _dbp3Con.text.trim(),
      'dbpreasure4': _dbp4Con.text.trim(),
      'dbpreasure5': _dbp5Con.text.trim(),
      'dhrate1': _dhr1Con.text.trim(),
      'dhrate2': _dhr2Con.text.trim(),
      'dhrate3': _dhr3Con.text.trim(),
      'dhrate4': _dhr4Con.text.trim(),
      'dhrate5': _dhr5Con.text.trim(),
      'abweight': _abwCon.text.trim(),
      'abpreasure': _abpCon.text.trim(),
      'ahrate': _ahrCon.text.trim(),
      'atemp': _atempCon.text.trim(),
      'pname': _pnameCon.text.trim(),
      'trdate': _trdateCon.text.trim(),
      'trtime': _trtimeCon.text.trim(),
    });
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Treatment Data added Successfully'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => DSTreatmentRecordPage()),
            ),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

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
                child: TextFormField(
                  controller: _pnameCon,
                  validator: (value) {
                    if (value == "") {
                      return "Patient name is required";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20),
                    filled: true,
                    fillColor: Colors.blueGrey[50],
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'Enter Patient Name',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),

              //date textfield
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Date',
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
                child: TextFormField(
                  controller: _trdateCon,
                  validator: (value) {
                    if (value == "") {
                      return "Date is required";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    icon: Icon(Icons.calendar_month_outlined),
                    contentPadding: EdgeInsets.only(left: 20),
                    filled: true,
                    fillColor: Colors.blueGrey[50],
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'Select Date',
                  ),
                  onTap: (() async {
                    DateTime? pickeddate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1700),
                        lastDate: DateTime(2101));
                    if (pickeddate != null) {
                      setState(() {
                        _trdateCon.text = dateFormat.format(pickeddate);
                      });
                    }
                  }),
                ),
              ),
              SizedBox(
                height: 15,
              ),

              //Time textfield
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Time',
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
                child: TextFormField(
                  controller: _trtimeCon,
                  validator: (value) {
                    if (value == "") {
                      return "Time is required";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    icon: Icon(Icons.access_time),
                    contentPadding: EdgeInsets.only(left: 20),
                    filled: true,
                    fillColor: Colors.blueGrey[50],
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'Select Time',
                  ),
                  onTap: (() async {
                    TimeOfDay? pickedtime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (pickedtime != null) {
                      setState(() {
                        _trtimeCon.text = pickedtime.format(context).toString();
                      });
                    }
                  }),
                ),
              ),
              SizedBox(height: 15,),

              Text(
                'Before Dialysis',
                style: TextStyle(fontSize: 16),
              ),

              SizedBox(
                height: 10,
              ),
              //Body weight textfield
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
                child: TextFormField(
                  controller: _bbwCon,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20),
                    filled: true,
                    fillColor: Colors.blueGrey[50],
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'Enter Body Weight',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),

              //Blood pressure textfield
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
                child: TextFormField(
                  controller: _bbpCon,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20),
                    filled: true,
                    fillColor: Colors.blueGrey[50],
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'Enter Blood Pressure',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),

              //Heart rate textfield
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Heart Rate',
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
                child: TextFormField(
                  controller: _bhrCon,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20),
                    filled: true,
                    fillColor: Colors.blueGrey[50],
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'Enter Heart Rate',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //Body Temp textfield
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Body Temperature',
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
                child: TextFormField(
                  controller: _btempCon,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20),
                    filled: true,
                    fillColor: Colors.blueGrey[50],
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'Enter Body Temperature',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),

              Text(
                'During Dialysis',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Blood Pressure: ',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 10,
              ),

              SizedBox(
                height: 10,
              ),
              //Dbp textfield
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Blood Pressure 1st Hour',
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
                child: TextFormField(
                  controller: _dbp1Con,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20),
                    filled: true,
                    fillColor: Colors.blueGrey[50],
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'Enter Blood Pressure',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //Blood pressure textfield
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Blood Pressure 2nd Hour',
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
                child: TextFormField(
                  controller: _dbp2Con,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20),
                    filled: true,
                    fillColor: Colors.blueGrey[50],
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'Enter Blood Pressure',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //Blood pressure textfield
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Blood Pressure 3rd Hour',
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
                child: TextFormField(
                  controller: _dbp3Con,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20),
                    filled: true,
                    fillColor: Colors.blueGrey[50],
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'Enter Blood Pressure',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //Blood pressure textfield
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Blood Pressure 4th Hour',
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
                child: TextFormField(
                  controller: _dbp4Con,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20),
                    filled: true,
                    fillColor: Colors.blueGrey[50],
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'Enter Blood Pressure',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //Blood pressure textfield
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Blood Pressure 5th Hour',
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
                child: TextFormField(
                  controller: _dbp5Con,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20),
                    filled: true,
                    fillColor: Colors.blueGrey[50],
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'Enter Blood Pressure',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),

              SizedBox(
                height: 10,
              ),
              Text(
                'Heart Rate:',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 10,
              ),

              //HR1 textfield
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Heart Rate 1st Hour',
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
                child: TextFormField(
                  controller: _dhr1Con,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20),
                    filled: true,
                    fillColor: Colors.blueGrey[50],
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'Enter Heart Rate',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //Blood pressure textfield
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Heart Rate 2nd Hour',
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
                child: TextFormField(
                  controller: _dhr2Con,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20),
                    filled: true,
                    fillColor: Colors.blueGrey[50],
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'Enter Heart Rate',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //hr textfield
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Heart Rate 3rd Hour',
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
                child: TextFormField(
                  controller: _dhr3Con,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20),
                    filled: true,
                    fillColor: Colors.blueGrey[50],
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'Enter Heart rate',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //Hr textfield
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Heart Rate 4th Hour',
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
                child: TextFormField(
                  controller: _dhr4Con,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20),
                    filled: true,
                    fillColor: Colors.blueGrey[50],
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'Enter Heart Rate',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //Blood pressure textfield
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Heart Rate 5th Hour',
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
                child: TextFormField(
                  controller: _dhr5Con,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20),
                    filled: true,
                    fillColor: Colors.blueGrey[50],
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'Enter Heart Rate',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
//AFTER
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
                      controller: _abwCon,
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
                      controller: _abwCon,
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

              //Heart rate textfield
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Heart Rate',
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
                child: TextFormField(
                  controller: _ahrCon,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20),
                    filled: true,
                    fillColor: Colors.blueGrey[50],
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'Enter Heart Rate',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),

              //Body Temp textfield
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Body Temperature',
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
                child: TextFormField(
                  controller: _atempCon,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20),
                    filled: true,
                    fillColor: Colors.blueGrey[50],
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'Enter Body Temperature',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
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
                  onPressed: addTreatmeant),
              SizedBox(
                height: 15,
              ),
            ],
          )
        ],
      ),
    );
  }
}
