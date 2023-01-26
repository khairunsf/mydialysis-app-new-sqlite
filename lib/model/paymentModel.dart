import 'dart:core';

class PaymentModel {
  int? bid, pid;
  String? bdate,
      btime,
      dtprice,
      mealprice,
      totalprice,
      bstatus,
      pdate,
      ptime,
      pamount,
      sid,
      uic;

  PaymentModel(
      {this.sid,
      this.bid,
      this.pid,
      this.bdate,
      this.btime,
      this.dtprice,
      this.mealprice,
      this.totalprice,
      this.bstatus,
      this.pdate,
      this.ptime,
      this.pamount,
      this.uic});

  //from json to class model
  factory PaymentModel.fromJson(Map<String, dynamic> json) {
    return PaymentModel(
      sid: json['sid'],
      uic: json['uic'],
      bid: json['bid'],
      pid: json['pid'],
      bdate: json['bdate'],
      btime: json['btime'],
      dtprice: json['dtprice'],
      mealprice: json['mealprice'],
      totalprice: json['totalprice'],
      bstatus: json['bstatus'],
      pdate: json['pdate'],
      ptime: json['ptime'],
      pamount: json['pamount'],
    );
  }
}
