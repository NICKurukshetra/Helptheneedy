// To parse this JSON data, do
//
//     final ngo = ngoFromJson(jsonString);

import 'dart:convert';

List<Ngo> ngoFromJson(String str) =>
    List<Ngo>.from(json.decode(str).map((x) => Ngo.fromJson(x)));

String ngoToJson(List<Ngo> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Ngo {
  Ngo({
    this.srno,
    this.ngo,
    this.ngoaction1,
    this.dated,
    this.dataid,
    this.remarks,
    this.ngomobile,
  });

  int srno;
  String ngo;
  String ngoaction1;
  DateTime dated;
  int dataid;
  String remarks;
  String ngomobile;

  factory Ngo.fromJson(Map<String, dynamic> json) => Ngo(
        srno: json["srno"],
        ngo: json["ngo"],
        ngoaction1: json["ngoaction1"],
        dated: DateTime.parse(json["dated"]),
        dataid: json["dataid"],
        remarks: json["remarks"],
        ngomobile: json["ngomobile"],
      );

  Map<String, dynamic> toJson() => {
        "srno": srno,
        "ngo": ngo,
        "ngoaction1": ngoaction1,
        "dated": dated,
        "dataid": dataid,
        "remarks": remarks,
        "ngomobile": ngomobile,
      };
}
