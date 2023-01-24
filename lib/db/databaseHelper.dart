// ignore_for_file: prefer_conditional_assignment, unused_field, unused_local_variable, prefer_collection_literals, deprecated_member_use, unnecessary_this, prefer_interpolation_to_compose_strings, unnecessary_null_comparison, file_names

import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:mydialysis_app/model/userModel.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper; //singleton dbhelper
  static Database? _database;

  String userTable = 'user_table';
  String coluid = 'uid';
  String coluname = 'uname';
  String colupwd = 'upwd';
  String colucpwd = 'ucpwd';
  String coluphoneNum = 'uphoneNum';
  String coluemail = 'uemail';
  String coludob = 'udob';
  String coluaddress = 'uaddress';
  String colugivenCode = 'ugivenCode';
  String colurole = 'urole';

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
    await db.execute(
        'CREATE TABLE $userTable($coluid INTEGER PRIMARY KEY AUTOINCREMENT, $coluname TEXT NULL, $colupwd TEXT NULL, $colucpwd TEXT NULL, $coluphoneNum TEXT NULL, $coluemail TEXT NULL, $coludob TEXT NULL, $coluaddress TEXT NULL, $colugivenCode TEXT NULL, $colurole TEXT NULL)');
  }

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
  Future<UserModel?> getLoginUser(
      String uemail, String upwd) async {
    final result = await _database!.rawQuery(
        'SELECT * FROM $userTable WHERE $coluemail = $uemail AND $colupwd = $upwd');
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
}
