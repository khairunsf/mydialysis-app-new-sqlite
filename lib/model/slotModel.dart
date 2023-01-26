import 'dart:core';

class SlotModel {
  int? sid;
  String? stime,
      sdate,
      sstatus,
      srequestid,
      srdate,
      srtime,
      srStatus,
      srReason,
      uic;

  SlotModel(
      {this.sid,
      this.sdate,
      this.stime,
      this.sstatus,
      this.srequestid,
      this.srdate,
      this.srtime,
      this.srStatus,
      this.srReason,
      this.uic});

  //from json to class model
  factory SlotModel.fromJson(Map<String, dynamic> json) {
    return SlotModel(
        sid: json['sid'],
        uic: json['uic'],
        sdate: json['sdate'],
        stime: json['stime'],
        sstatus: json['sstatus'],
        srequestid: json['srequestid'],
        srdate: json['srdate'],
        srtime: json['srtime'],
        srStatus: json['srStatus'],
        srReason: json['srReason']);
  }
}
