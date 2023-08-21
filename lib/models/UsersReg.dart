// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

import 'dart:convert';

List<Users> usersFromJson(String str) =>
    List<Users>.from(json.decode(str).map((x) => Users.fromJson(x)));

String usersToJson(List<Users> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Users {
  Users({
    this.srno,
    this.name,
    this.email,
    this.mobile,
    this.photourl,
    this.type,
    this.cat,
    this.ngoname,
    this.approve,
  });

  int srno;
  String name;
  String email;
  String mobile;
  String photourl;
  String type;
  String cat;
  String ngoname;
  dynamic approve;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        srno: json["srno"],
        name: json["name"],
        email: json["email"],
        mobile: json["mobile"],
        photourl: json["photourl"],
        type: json["type"],
        cat: json["cat"],
        ngoname: json["ngoname"],
        approve: json["approve"],
      );

  Map<String, dynamic> toJson() => {
        "srno": srno,
        "name": name,
        "email": email,
        "mobile": mobile,
        "photourl": photourl,
        "type": type,
        "cat": cat,
        "ngoname": ngoname,
        "approve": approve,
      };
}
