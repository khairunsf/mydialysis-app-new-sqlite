import 'dart:core';

class DirectoryModel {
  int? did;
  String? dname, daddress, dcnumber, dlogo, dkm, dopenhr, dclosehr, drating;

  DirectoryModel(
      {this.did,
      this.dname,
      this.daddress,
      this.dcnumber,
      this.dlogo,
      this.dkm,
      this.dopenhr,
      this.dclosehr,
      this.drating});

  //from json to class model
  factory DirectoryModel.fromJson(Map<String, dynamic> json) {
    return DirectoryModel(
        did: json['did'],
        dname: json['dname'],
        daddress: json['daddress'],
        dcnumber: json['dcnumber'],
        dlogo: json['dlogo'],
        dkm: json['dkm'],
        dopenhr: json['dopenhr'],
        dclosehr: json['dclosehr'],
        drating: json['drating']);
  }
}
