import 'dart:core';

class SlotModel {
  int? sid;
  String? stime,
      sdate,
      sstatus,
      srdate,
      srtime,
      srStatus,
      srReason,
      uid;

  SlotModel(
      {this.sid,
      this.sdate,
      this.stime,
      this.sstatus,
      this.srdate,
      this.srtime,
      this.srStatus,
      this.srReason,
      this.uid});

  //from json to class model
  factory SlotModel.fromJson(Map<String, dynamic> json) {
    return SlotModel(
        sid: json['sid'],
        uid: json['uid'],
        sdate: json['sdate'],
        stime: json['stime'],
        sstatus: json['sstatus'],
        srdate: json['srdate'],
        srtime: json['srtime'],
        srStatus: json['srStatus'],
        srReason: json['srReason']);
  }
}
