// ignore_for_file: prefer_conditional_assignment, unused_field, unused_local_variable, prefer_collection_literals, deprecated_member_use, unnecessary_this, prefer_interpolation_to_compose_strings, unnecessary_null_comparison, file_names

import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:mydialysis_app/model/userModel.dart';
import '../model/appointmentModel.dart';
import '../model/directoryModel.dart';
import '../model/paymentModel.dart';
import '../model/slotModel.dart';
import '../model/treatmentModel.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper; //singleton dbhelper
  static Database? _database;

  //userTable
  String userTable = 'userTable';
  String coluid = 'uid';
  String coluic = 'uic';
  String coluname = 'uname';
  String colupwd = 'upwd';
  String colucpwd = 'ucpwd';
  String coluphoneNum = 'uphoneNum';
  String coluemail = 'uemail';
  String coludob = 'udob';
  String coluaddress = 'uaddress';
  String colugivenCode = 'ugivenCode';
  String colurole = 'urole';

  //slotTable
  String slotTable = 'slotTable';
  String colsid = 'sid';
  String colstime = 'stime';
  String colsdate = 'sdate';
  String colsstatus = 'sstatus';
  String colsrdate = 'srdate';
  String colsrtime = 'srtime';
  String colsrStatus = 'srStatus';
  String colsrReason = 'srReason';
  String colspname = 'pname';

  //treatmentTable
  String treatmentTable = 'treatmentTable';
  String coltrid = 'trid';
  String colbbw = 'bbweight';
  String colbbp = 'bbpreasure';
  String colbhr = 'bhrate';
  String colbtemp = 'btemp';
  String coldbp1 = 'dbpreasure1';
  String coldbp2 = 'dbpreasure2';
  String coldbp3 = 'dbpreasure3';
  String coldbp4 = 'dbpreasure4';
  String coldbp5 = 'dbpreasure5';
  String coldhr1 = 'dhrate1';
  String coldhr2 = 'dhrate2';
  String coldhr3 = 'dhrate3';
  String coldhr4 = 'dhrate4';
  String coldhr5 = 'dhrate5';
  String colabw = 'abweight';
  String colabp = 'abpreasure';
  String colahr = 'ahrate';
  String colatemp = 'atemp';
  String coltrpname = 'pname';
  String coltrdate = 'trdate';
  String coltrtime = 'trtime';

  //paymentTable
  String paymentTable = 'paymentTable';
  String colbid = 'bid';
  String colpid = 'pid';
  String colbdate = 'bdate';
  String colbtime = 'btime';
  String coldtprice = 'dtprice';
  String colmealprice = 'mealprice';
  String coltotalprice = 'totalprice';
  String colbstatus = 'bstatus';
  String colpdate = 'pdate';
  String colptime = 'ptime';
  String colpamount = 'pamount';
  String colppname = 'pname';

  //directoryTable
  String directoryTable = 'directoryTable';
  String coldid = 'did';
  String coldname = 'dname';
  String coldaddress = 'daddress';
  String coldcnumber = 'dcnumber';
  String coldlogo = 'dlogo';
  String coldkm = 'dkm';
  String coldopenhr = 'dopenhr';
  String coldclosehr = 'dclosehr';
  String coldrating = 'drating';

  //appointmentTable
  String appointmentTable = 'appointmentTable';
  String colaid = 'aid';
  String colaplace = 'aplace';
  String coladate = 'adate';
  String colatime = 'atime';
  String coldrname = 'drname';
  String coldrdetail = 'drdetail';
  String coldrroom = 'drroom';
  String colastatus = 'astatus';
  String colardate = 'ardate';
  String colartime = 'artime';
  String colarreason = 'arreason';
  String colarstatus = 'arstatus';
  String colareview = 'areview';
  String colapname = 'pname';

  DatabaseHelper._createInstance(); //named constructor to create instance of dbhelper

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper =
          DatabaseHelper._createInstance(); //executed only once, singleton obj
    }
    return _databaseHelper!;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    //get directory path
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + '/myDialysis.db'; //db name
    print(path);

    //open/create db at given path
    var myDatabase = await openDatabase(path, version: 1, onCreate: _createDB);
    return myDatabase;
  }

  //creating db(table and fields)
  void _createDB(Database db, int newVersion) async {
    //user table
    String table1 =
        'CREATE TABLE $userTable($coluid INTEGER PRIMARY KEY AUTOINCREMENT, $coluname TEXT NULL, $coluic TEXT UNIQUE , $colupwd TEXT NULL, $colucpwd TEXT NULL, $coluphoneNum TEXT NULL, $coluemail TEXT NULL UNIQUE, $coludob TEXT NULL, $coluaddress TEXT NULL, $colugivenCode TEXT NULL, $colurole TEXT NULL)';
    //slot table
    String table2 =
        'CREATE TABLE $slotTable($colsid INTEGER PRIMARY KEY AUTOINCREMENT, $colsdate DATE NULL, $colstime TIME NULL, $colsstatus TEXT NULL, $colsrdate DATE NULL, $colsrtime TIME NULL, $colsrStatus TEXT NULL, $colsrReason TEXT NULL, $colspname TEXT NULL)';
    //treatment table
    String table3 =
        'CREATE TABLE $treatmentTable($coltrid INTEGER PRIMARY KEY AUTOINCREMENT, $colbbw TEXT NULL, $colbbp TEXT NULL, $colbhr TEXT NULL, $colbtemp TEXT NULL, $coldbp1 TEXT NULL, $coldbp2 TEXT NULL, $coldbp3 TEXT NULL, $coldbp4 TEXT NULL, $coldbp5 TEXT NULL, $coldhr1 TEXT NULL, $coldhr2 TEXT NULL, $coldhr3 TEXT NULL, $coldhr4 TEXT NULL, $coldhr5 TEXT NULL, $colabw TEXT NULL, $colabp TEXT NULL, $colahr TEXT NULL, $colatemp TEXT NULL, $coltrpname TEXT NULL, $coltrdate DATE NULL, $coltrtime TIME NULL)';
    //payment table
    String table4 =
        'CREATE TABLE $paymentTable($colbid INTEGER PRIMARY KEY AUTOINCREMENT, $colbdate DATE NULL, $colbtime TIME NULL, $coldtprice TEXT NULL, $colmealprice TEXT NULL, $coltotalprice TEXT NULL, $colbstatus TEXT NULL, $colpdate DATE NULL, $colptime TIME NULL, $colpamount FLOAT NULL, $colppname TEXT NULL)';
    //directory table
    String table5 =
        'CREATE TABLE $directoryTable($coldid INTEGER PRIMARY KEY AUTOINCREMENT, $coldname TEXT NULL, $coldaddress TEXT NULL, $coldcnumber TEXT NULL, $coldlogo VARCHAR(50) NULL, $coldkm TEXT NULL, $coldopenhr TEXT NULL, $coldclosehr TEXT NULL, $coldrating TEXT NULL)';
    //appointment table
    String table6 =
        'CREATE TABLE $appointmentTable($colaid INTEGER PRIMARY KEY AUTOINCREMENT, $coladate DATE NULL, $colatime TIME NULL, $colaplace TEXT NULL, $coldrname TEXT NULL, $coldrdetail TEXT NULL, $coldrroom TEXT NULL, $colastatus TEXT NULL, $colardate DATE NULL, $colartime TIME NULL, $colarstatus TEXT NULL, $colarreason TEXT NULL, $colareview TEXT NULL, $colapname)';

    await db.execute(table1);
    await db.execute(table2);
    await db.execute(table3);
    await db.execute(table4);
    await db.execute(table5);
    await db.execute(table6);
  }

  
  //USER CRUD
  //fetch operation: get all data from db
  Future<List<UserModel>> getAllUser() async {
    final data = await _database!.query(userTable);
    List<UserModel> result = data.map((e) => UserModel.fromJson(e)).toList();
    return result;
  }
  //fetch one user only
  Future<List<Map<String, dynamic>>> getUserbyId(int uid) async {
    final result = await _database!
        .rawQuery('SELECT * FROM $userTable WHERE $coluid = $uid');
    return result;
  }
  //fetch one patient only
  Future<List<Map<String, dynamic>>> getPatient() async {
    final result = await _database!
        .rawQuery('SELECT * FROM $userTable WHERE $colurole = "Patient"');
    return result;
  }
  //fetch one user only by email
  Future<List<Map<String, dynamic>>> getUserbyEmail(String uemail) async {
    final result = await _database!
        .rawQuery('SELECT * FROM $userTable WHERE $coluemail = $uemail');
    return result;
  }
  //fetch one user only by email and password
  Future<UserModel?> getLoginUser(String uemail, String upwd) async {
    final result = await _database!.rawQuery(
        "SELECT * FROM $userTable WHERE $coluemail = ? AND $colupwd = ?",
        [uemail, upwd]);
    if (result.isNotEmpty) {
      return UserModel.fromJson(result.first);
    }
    return null;
  }
  //insert operation: insert data obj from db
  Future<int> insertUser(Map<String, dynamic> row) async {
    final result = await _database!.insert(userTable, row);
    return result;
  }
  //update operation: update data obj from db & save to db
  Future<int> updateUser(int uid, Map<String, dynamic> row) async {
    final result = await _database!
        .update(userTable, row, where: '$coluid = ?', whereArgs: [uid]);
    return result;
  }
  //delete operation: delete data obj from db
  Future<int> deleteUser(int uid) async {
    var db = await this.database;
    int result =
        await db.rawDelete('DELETE FROM $userTable WHERE $coluid = $uid');
    return result;
  }
  //get number of data obj in db
  Future<int?> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x =
        await db.query('SELECT COUNT (*) from $userTable');
    int? result = Sqflite.firstIntValue(x);
    return result;
  }

  //SLOT TIME CRUD
  //fetch all slot data
  Future<List<SlotModel>> getAllSlot() async {
    final data = await _database!.query(slotTable);
    List<SlotModel> result = data.map((e) => SlotModel.fromJson(e)).toList();
    return result;
  }
  //fetch one patient only
  Future<List<Map<String, dynamic>>> getSlot() async {
    final result = await _database!
        .rawQuery('SELECT * FROM $slotTable');
    return result;
  }
  //fetch one slot data only by uid
  Future<List<Map<String, dynamic>>> getSlotData(int sid) async {
    final result = await _database!
        .rawQuery('SELECT * FROM $slotTable WHERE $colsid = $sid');
    return result;
  }
  //fetch data only
  Future<List<Map<String, dynamic>>> getUserSlot(String? pname) async {
    final result = await _database!
        .rawQuery('SELECT * FROM $slotTable WHERE $colspname = $pname');
    return result;
  }
  //fetch one patient only
  Future<List<Map<String, dynamic>>> getCompleteSlot() async {
    final result = await _database!
        .rawQuery('SELECT * FROM $slotTable WHERE $colsstatus = "Completed"');
    return result;
  }
  //fetch one patient only
  Future<List<Map<String, dynamic>>> getUpcomingSlot() async {
    final result = await _database!
        .rawQuery('SELECT * FROM $slotTable WHERE $colsstatus = "Pending"');
    return result;
  }
  //insert slot data obj from db
  Future<int> insertSlot(Map<String, dynamic> row) async {
    final result = await _database!.insert(slotTable, row);
    return result;
  }
  //update slot data obj from db & save to db
  Future<int> updateSlot(int sid, Map<String, dynamic> row) async {
    final result = await _database!
        .update(slotTable, row, where: '$colsid = ?', whereArgs: [sid]);
    return result;
  }
  //delete slot data obj from db
  Future<int> deleteSlot(int sid) async {
    var db = await this.database;
    int result =
        await db.rawDelete('DELETE FROM $slotTable WHERE $colsid = $sid');
    return result;
  }

  //TREATMENT DATA CRUD
  //fetch all treatment data
  Future<List<TreatmentModel>> getAllTreatment() async {
    final data = await _database!.query(treatmentTable);
    List<TreatmentModel> result = data.map((e) => TreatmentModel.fromJson(e)).toList();
    return result;
  }
  //fetch one treatment data only by id
  Future<List<Map<String, dynamic>>> getTreatmentData(int trid) async {
    final result = await _database!
        .rawQuery('SELECT * FROM $treatmentTable WHERE $coltrid = $trid');
    return result;
  }
  //fetch data only
  Future<List<Map<String, dynamic>>> getTreatment() async {
    final result = await _database!
        .rawQuery('SELECT * FROM $treatmentTable');
    return result;
  }
  //fetch data only
  Future<List<Map<String, dynamic>>> getUserTreatment(String pname) async {
    final result = await _database!
        .rawQuery('SELECT * FROM $treatmentTable WHERE $coltrpname = $pname');
    return result;
  }
  //insert treatment data obj from db
  Future<int> insertData(Map<String, dynamic> row) async {
    final result = await _database!.insert(treatmentTable, row);
    return result;
  }
  //update tr data data obj from db & save to db
  Future<int> updateData(int trid, Map<String, dynamic> row) async {
    final result = await _database!
        .update(treatmentTable, row, where: '$coltrid = ?', whereArgs: [trid]);
    return result;
  }
  //delete tr data data obj from db
  Future<int> deleteData(int trid) async {
    var db = await this.database;
    int result =
        await db.rawDelete('DELETE FROM $treatmentTable WHERE $coltrid = $trid');
    return result;
  }

  //PAYMENT CRUD
  //fetch all payment data
  Future<List<PaymentModel>> getAllPayment() async {
    final data = await _database!.query(paymentTable);
    List<PaymentModel> result = data.map((e) => PaymentModel.fromJson(e)).toList();
    return result;
  }
  //fetch one payment data only by bid
  Future<List<Map<String, dynamic>>> getPaymentData(int bid) async {
    final result = await _database!
        .rawQuery('SELECT * FROM $paymentTable WHERE $colbid = $bid');
    return result;
  }
  //fetch data only
  Future<List<Map<String, dynamic>>> getPayment() async {
    final result = await _database!
        .rawQuery('SELECT * FROM $paymentTable');
    return result;
  }
  //fetch data only
  Future<List<Map<String, dynamic>>> getUserPayment(String pname) async {
    final result = await _database!
        .rawQuery('SELECT * FROM $paymentTable WHERE $colppname = $pname');
    return result;
  }
  //insert payment data obj from db
  Future<int> insertPayment(Map<String, dynamic> row) async {
    final result = await _database!.insert(paymentTable, row);
    return result;
  }
  //update payment data obj from db & save to db
  Future<int> updatePayment(int bid, Map<String, dynamic> row) async {
    final result = await _database!
        .update(paymentTable, row, where: '$colbid = ?', whereArgs: [bid]);
    return result;
  }
  //delete payment data obj from db
  Future<int> deletePayment(int bid) async {
    var db = await this.database;
    int result =
        await db.rawDelete('DELETE FROM $paymentTable WHERE $colbid = $bid');
    return result;
  }

  //DIRECTORY CRUD
  //fetch all directory data
  Future<List<DirectoryModel>> getAllDirectory() async {
    final data = await _database!.query(directoryTable);
    List<DirectoryModel> result = data.map((e) => DirectoryModel.fromJson(e)).toList();
    return result;
  }
  //fetch one directory data only by uid
  Future<List<Map<String, dynamic>>> getDirectoryData(int did) async {
    final result = await _database!
        .rawQuery('SELECT * FROM $directoryTable WHERE $coldid = $did');
    return result;
  }
  //fetch data only
  Future<List<Map<String, dynamic>>> getDirectory() async {
    final result = await _database!
        .rawQuery('SELECT * FROM $directoryTable');
    return result;
  }
  //insert directory data obj from db
  Future<int> insertDirectory(Map<String, dynamic> row) async {
    final result = await _database!.insert(directoryTable, row);
    return result;
  }
  //update directory data obj from db & save to db
  Future<int> updateDirectory(int did, Map<String, dynamic> row) async {
    final result = await _database!
        .update(directoryTable, row, where: '$coldid = ?', whereArgs: [did]);
    return result;
  }
  //delete directory data obj from db
  Future<int> deleteDirectory(int did) async {
    var db = await this.database;
    int result =
        await db.rawDelete('DELETE FROM $directoryTable WHERE $coldid = $did');
    return result;
  }
  
  //APPOINTMENT CRUD
  //fetch all appointment data
  Future<List<AppointmentModel>> getAllAppointment() async {
    final data = await _database!.query(userTable);
    List<AppointmentModel> result = data.map((e) => AppointmentModel.fromJson(e)).toList();
    return result;
  }
  //fetch one appointment data only by uid
  Future<List<Map<String, dynamic>>> getAppointmentData(int aid) async {
    final result = await _database!
        .rawQuery('SELECT * FROM $appointmentTable WHERE $colaid = $aid');
    return result;
  }
  //fetch data only
  Future<List<Map<String, dynamic>>> getAppointment() async {
    final result = await _database!
        .rawQuery('SELECT * FROM $appointmentTable');
    return result;
  }
  //fetch data only
  Future<List<Map<String, dynamic>>> getUserAppointment(String pname) async {
    final result = await _database!
        .rawQuery('SELECT * FROM $appointmentTable WHERE $colapname = $pname');
    return result;
  }
  //fetch one patient only
  Future<List<Map<String, dynamic>>> getCompleteApp() async {
    final result = await _database!
        .rawQuery('SELECT * FROM $appointmentTable $colastatus = "Completed"');
    return result;
  }
  //fetch one patient only
  Future<List<Map<String, dynamic>>> getUpcomingApp() async {
    final result = await _database!
        .rawQuery('SELECT * FROM $appointmentTable WHERE $colastatus = "Pending"');
    return result;
  }
  //insert appointment data obj from db
  Future<int> insertAppointment(Map<String, dynamic> row) async {
    final result = await _database!.insert(appointmentTable, row);
    return result;
  }
  //update appointment data obj from db & save to db
  Future<int> updateAppointment(int aid, Map<String, dynamic> row) async {
    final result = await _database!
        .update(appointmentTable, row, where: '$colaid = ?', whereArgs: [aid]);
    return result;
  }
  //delete appointment data obj from db
  Future<int> deleteAppointment(int? aid) async {
    var db = await this.database;
    int result =
        await db.rawDelete('DELETE FROM $appointmentTable WHERE $colaid = $aid');
    return result;
  }
}
