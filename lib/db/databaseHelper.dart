// ignore_for_file: prefer_conditional_assignment, unused_field, unused_local_variable, prefer_collection_literals, deprecated_member_use, unnecessary_this, prefer_interpolation_to_compose_strings, unnecessary_null_comparison, file_names

import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:mydialysis_app/model/userModel.dart';

import '../model/slotModel.dart';

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
  String colsuid = 'uid';

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
  String coltruid = 'uid';
  String coltrsid = 'sid';

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
  String colpsid = 'sid';
  String colpuid = 'uid';

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
  String colauid = 'uid';

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
        'CREATE TABLE $slotTable($colsid INTEGER PRIMARY KEY AUTOINCREMENT, $colsdate DATE NULL, $colstime TIME NULL, $colsstatus TEXT NULL, $colsrdate DATE NULL, $colsrtime TIME NULL, $colsrStatus TEXT NULL, $colsrReason TEXT NULL, $coluid INTEGER, FOREIGN KEY ($coluid) REFERENCES $userTable($coluid))';
    //treatment table
    String table3 =
        'CREATE TABLE $treatmentTable($coltrid INTEGER PRIMARY KEY AUTOINCREMENT, $colbbw INTEGER NULL, $colbbp TEXT NULL, $colbhr INTEGER NULL, $colbtemp INTEGER NULL, $coldbp1 TEXT NULL, $coldbp2 TEXT NULL, $coldbp3 TEXT NULL, $coldbp4 TEXT NULL, $coldbp5 TEXT NULL, $coldhr1 INTEGER NULL, $coldhr2 INTEGER NULL, $coldhr3 INTEGER NULL, $coldhr4 INTEGER NULL, $coldhr5 INTEGER NULL, $colabw INTEGER NULL, $colabp TEXT NULL, $colahr INTEGER NULL, $colatemp INTEGER NULL, $colsid INTEGER, FOREIGN KEY ($colsid) REFERENCES $slotTable($colsid))';
    //payment table
    String table4 =
        'CREATE TABLE $paymentTable($colbid INTEGER PRIMARY KEY AUTOINCREMENT, $colbdate DATE NULL, $colbtime TIME NULL, $coldtprice FLOAT NULL, $colmealprice FLOAT NULL, $coltotalprice FLOAT NULL, $colbstatus TEXT NULL, $colpdate DATE NULL, $colptime TIME NULL, $colpamount FLOAT NULL, $colsid INTEGER, FOREIGN KEY ($colsid) REFERENCES $slotTable($colsid))';
    //directory table
    String table5 =
        'CREATE TABLE $directoryTable($coldid INTEGER PRIMARY KEY AUTOINCREMENT, $coldname TEXT NULL, $coldaddress TEXT NULL, $coldcnumber TEXT NULL, $coldlogo VARCHAR(50) NULL, $coldkm FLOAT NULL, $coldopenhr FLOAT NULL, $coldclosehr FLOAT NULL, $coldrating TEXT NULL)';
    //appointment table
    String table6 =
        'CREATE TABLE $appointmentTable($colaid INTEGER PRIMARY KEY AUTOINCREMENT, $coladate DATE NULL, $colatime TIME NULL, $colaplace TEXT NULL, $coldrname TEXT NULL, $coldrdetail TEXT NULL, $coldrroom TEXT NULL, $colastatus TEXT NULL, $colardate DATE NULL, $colartime TIME NULL, $colarstatus TEXT NULL, $colarreason TEXT NULL, $colareview TEXT NULL, $coluid INTEGER, FOREIGN KEY ($coluid) REFERENCES $userTable($coluid))';

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
    final data = await _database!.query(userTable);
    List<SlotModel> result = data.map((e) => SlotModel.fromJson(e)).toList();
    return result;
  }
  //fetch one slot data only by uid
  Future<List<Map<String, dynamic>>> getSlotData(int sid) async {
    final result = await _database!
        .rawQuery('SELECT * FROM $slotTable WHERE $colsid = $sid');
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
}
