import 'dart:core';

class PaymentModel {
  int? bid;
  String? bdate,
      btime,
      dtprice,
      mealprice,
      totalprice,
      bstatus,
      pdate,
      ptime,
      pamount,
      sid;

  PaymentModel(
      {this.sid,
      this.bid,
      this.bdate,
      this.btime,
      this.dtprice,
      this.mealprice,
      this.totalprice,
      this.bstatus,
      this.pdate,
      this.ptime,
      this.pamount,});

  //from json to class model
  factory PaymentModel.fromJson(Map<String, dynamic> json) {
    return PaymentModel(
      sid: json['sid'],
      bid: json['bid'],
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
