import 'dart:core';

class TreatmentModel {
  int? trid;
  String? bbweight,
      bbpreasure,
      bhrate,
      btemp,
      dbpreasure1,
      dbpreasure2,
      dbpreasure3,
      dbpreasure4,
      dbpreasure5,
      dhrate1,
      dhrate2,
      dhrate3,
      dhrate4,
      dhrate5,
      abweight,
      abpreasure,
      ahrate,
      atemp,
      uic,
      sid;

  TreatmentModel(
      {this.trid,
      this.bbweight,
      this.bbpreasure,
      this.bhrate,
      this.btemp,
      this.dbpreasure1,
      this.dbpreasure2,
      this.dbpreasure3,
      this.dbpreasure4,
      this.dbpreasure5,
      this.dhrate1,
      this.dhrate2,
      this.dhrate3,
      this.dhrate4,
      this.dhrate5,
      this.abweight,
      this.abpreasure,
      this.ahrate,
      this.atemp,
      this.uic,
      this.sid});

  //from json to class model
  factory TreatmentModel.fromJson(Map<String, dynamic> json) {
    return TreatmentModel(
        trid: json['trid'],
        uic: json['uic'],
        sid: json['sid'],
        bbweight: json['bbweight'],
        bbpreasure: json['bbpreasure'],
        bhrate: json['bhrate'],
        btemp: json['btemp'],
        dbpreasure1: json['dbpreasure1'],
        dbpreasure2: json['dbpreasure2'],
        dbpreasure3: json['dbpreasure3'],
        dbpreasure4: json['dbpreasure4'],
        dbpreasure5: json['dbpreasure5'],
        dhrate1: json['dhrate1'],
        dhrate2: json['dhrate2'],
        dhrate3: json['dhrate3'],
        dhrate4: json['dhrate4'],
        dhrate5: json['dhrate5'],
        abweight: json['abweight'],
        abpreasure: json['abpreasure'],
        ahrate: json['ahrate'],
        atemp: json['atemp']);
  }
}
