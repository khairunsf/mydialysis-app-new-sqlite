import 'dart:core';

class AppointmentModel {
  int? aid;
  String? aplace,
      adate,
      atime,
      drname,
      drdetail,
      drroom,
      astatus,
      ardate,
      artime,
      arreason,
      arstatus,
      areview,
      pname;

  AppointmentModel(
      {this.aid,
      this.aplace,
      this.adate,
      this.atime,
      this.astatus,
      this.ardate,
      this.artime,
      this.arreason,
      this.arstatus,
      this.areview,
      this.drname,
      this.drdetail,
      this.drroom,
      this.pname});

  //from json to class model
  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
        aid: json['aid'],
        pname: json['pname'],
        aplace: json['aplace'],
        adate: json['adate'],
        atime: json['atime'],
        drname: json['drname'],
        drdetail: json['drdetail'],
        drroom: json['drroom'],
        astatus: json['astatus'],
        ardate: json['ardate'],
        artime: json['artime'],
        arreason: json['arreason'],
        arstatus: json['arstatus'],
        areview: json['areview']);
  }
}
