// To parse this JSON data, do
//
//     final ngoList = ngoListFromJson(jsonString);

import 'dart:convert';

List<NgoList> ngoListFromJson(String str) =>
    List<NgoList>.from(json.decode(str).map((x) => NgoList.fromJson(x)));

String ngoListToJson(List<NgoList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NgoList {
  NgoList({
    this.srno,
    this.category,
    this.tel,
    this.ngo,
    this.fbaccount,
  });

  int srno;
  String category;
  String tel;
  String ngo;
  dynamic fbaccount;

  factory NgoList.fromJson(Map<String, dynamic> json) => NgoList(
        srno: json["srno"],
        category: json["category"],
        tel: json["tel"],
        ngo: json["ngo"],
        fbaccount: json["fbaccount"],
      );

  Map<String, dynamic> toJson() => {
        "srno": srno,
        "category": category,
        "tel": tel,
        "ngo": ngo,
        "fbaccount": fbaccount,
      };
}
