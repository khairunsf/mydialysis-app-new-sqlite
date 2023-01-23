// ignore_for_file: unnecessary_this, prefer_collection_literals

import 'dart:core';

class UserModel {
  int? uid;
  String? uname,
      upwd,
      ucpwd,
      uphoneNum,
      uemail,
      udob,
      uaddress,
      ugivenCode,
      urole;

  UserModel(
      {this.uid,
      this.uname,
      this.upwd,
      this.ucpwd,
      this.uphoneNum,
      this.uemail,
      this.udob,
      this.uaddress,
      this.ugivenCode,
      this.urole});

  //from json to class model
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        uid: json['uid'],
        uname: json['uname'],
        upwd: json['upwd'],
        ucpwd: json['ucpwd'],
        uphoneNum: json['uphoneNum'],
        uemail: json['uemail'],
        udob: json['udob'],
        uaddress: json['uaddress'],
        ugivenCode: json['ugivencode'],
        urole: json['urole']);
  }
}
